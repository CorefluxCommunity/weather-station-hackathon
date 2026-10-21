#!/bin/sh
# Add this repository to the broker once MQTT is accepting commands.
#
# docker-compose.yml mounts the repo at /opt/weather-station inside the broker.
# -addProject names the project after that directory (weather-station), so its
# notebooks are listed in the HUB's LoT Editor. The project is not loaded:
# -loadProject would deploy every cell at once, and the labs deploy them one by
# one. A later start leaves the copy already on the broker in place, so edits
# made in the HUB survive a restart. `docker compose down -v` wipes that copy
# with the rest of the broker data.
set -u

HOST="${MQTT_HOST:-broker}"
PORT="${MQTT_PORT:-1883}"
USER="${MQTT_USER:-root}"
PASS="${MQTT_PASSWORD:-coreflux}"
PROJECT_PATH="${PROJECT_PATH:-/opt/weather-station}"
PROJECT_NAME="${PROJECT_NAME:-weather-station}"

# Publish one command and return the Command/Output line that carries its
# request id. The HUB uses the same topic, so the first message is not always
# ours. Command/Output is not retained. Retries cover the window where port
# 1883 is open before the broker is ready to run commands.
reply() {
  payload=$1
  id=$2
  attempt=0
  while [ "$attempt" -lt 30 ]; do
    out="/tmp/cf-${id}.log"
    : >"$out"
    # The broker rejects a second connection with an empty client id, and sub
    # and pub are connected at the same time, so each needs its own id.
    mosquitto_sub -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" \
      -i "load-project-sub" \
      -t '$SYS/Coreflux/Command/Output' -W 25 >"$out" 2>/dev/null &
    sub=$!
    sleep 2
    if mosquitto_pub -h "$HOST" -p "$PORT" -u "$USER" -P "$PASS" \
        -i "load-project-pub" \
        -t '$SYS/Coreflux/Command' -m "$payload" >/dev/null 2>&1; then
      n=0
      while [ "$n" -lt 20 ]; do
        if grep -q "$id" "$out" 2>/dev/null; then
          kill "$sub" 2>/dev/null || true
          wait "$sub" 2>/dev/null || true
          grep "$id" "$out" | tail -n 1
          return 0
        fi
        n=$((n + 1))
        sleep 1
      done
    fi
    kill "$sub" 2>/dev/null || true
    wait "$sub" 2>/dev/null || true
    attempt=$((attempt + 1))
    sleep 2
  done
  echo "No reply for: $payload" >&2
  return 1
}

ok() {
  printf '%s' "$1" | grep -Eq '"success"[[:space:]]*:[[:space:]]*true'
}

echo "Waiting for the broker at ${HOST}:${PORT}..."

add=$(reply "-addProject ${PROJECT_PATH} -requestId hackathon-add" hackathon-add) || exit 1
echo "$add"
if ok "$add"; then
  echo "Added project '${PROJECT_NAME}'."
elif printf '%s' "$add" | grep -q 'already exists'; then
  echo "Project '${PROJECT_NAME}' is already on the broker."
else
  echo "Could not add project '${PROJECT_NAME}'." >&2
  exit 1
fi

echo "Project '${PROJECT_NAME}' is ready in the LoT Editor."
