# Campus Weather Station — Setup & Reference

> **Doing the hackathon?** Start with **[`../HACKATHON.md`](../HACKATHON.md)** for the full step-by-step walkthrough with screenshots (and **[`../PREREQUISITES.md`](../PREREQUISITES.md)** to verify Docker first). This page is a quick reference for commands, ports, licensing, and project files.

---

## 1. Start, stop, and reset the environment

Run all Docker Compose commands from inside this `project/` folder:

```bash
# Start Broker, HUB, and Mailpit, then wait for the weather-station project to load
docker compose up -d
docker compose wait load-project

# Check logs of the project loader if needed
docker compose logs load-project

# Stop containers (keeps your broker state and licence in the Docker volume)
docker compose down

# Full reset: stop containers AND wipe all broker data to start from zero
docker compose down -v
```

### Services & ports

| Service | Address | Credentials / Notes |
|---|---|---|
| **Coreflux HUB** | http://localhost:3000 | Pre-filled connection: host `broker`, port `1883`, user `root`, password `coreflux` |
| **Mailpit (test inbox)** | http://localhost:8025 | Web inbox for viewing alert emails sent in Lab 4 |
| **Coreflux Broker (MQTT)** | `localhost:1883` | For VS Code or external MQTT clients (`root` / `coreflux`) |
| **Broker health & licence** | http://localhost:9100/health · `/license` | HTTP health and active licence tier |

> **Port already in use?** If port `1883`, `3000`, `8025`, or `9100` is taken on your machine, edit the left-hand port number in `docker-compose.yml` (for example, `"3001:3000"`) and run `docker compose up -d` again.

> **Pinned image versions:** `docker-compose.yml` uses **Coreflux Broker `2.22.0`** and **Coreflux HUB `2.12.0`** (`DEFINE CONNECTOR` requires Broker 2.22+). Organisers should run `docker compose pull` before the event to pre-cache the images.

---

## 2. Licensing (Community vs. Event Licence)

A fresh broker starts on **Community Edition**, which covers every lab except deploying custom RBAC Rules in **Lab 5** (and the 4th Connector in Stretch Goal 6).

| Notebook | Community Edition | Event Licence (Trial / Growth / Enterprise) |
|---|---|---|
| `00-setup`, `01-heartbeat`, `02-model-processweather`, `06-panel` | Supported | Supported |
| `03-campus-weather` + `04-heat-alert-history-email` (3 Connectors total) | Supported (uses all 3 Community Connectors) | Supported |
| `05-rules` (`DEFINE RULE`) | Read-along only (custom Rules require a licence) | Supported |
| `07-stretch` (Stretch Goal 6: `DEFINE THING`) | Remove 1 Connector first (`-removeConnector <Name>`) | Supported |

### Activating an event licence code

1. In the HUB, click **`root` (top right) → Broker Settings → License → Activation code**.
2. Paste the `CFLX-…` code provided by the organisers and click **Activate** (or run `-activateLicense CFLX-your-code` in **Command Console**).
3. The badge next to `root` at the top right updates from `Community` to your licence tier.

> **Note on seats:** Each broker activation uses one seat of the event licence. Avoid running `docker compose down -v` after activating, as wiping the volume removes the licence from your container.
> *(For organisers: you can also pre-populate `COREFLUX_ACTIVATION_CODE` in `docker-compose.yml` before the first `docker compose up`.)*

---

## 3. Initial setup commands (`00-setup.lotnb`)

### Environment variables & secret

In the HUB, open **Command Console** (`root` at top right → **Command Console**) and run one line at a time:

```text
-setEnv WEATHER_LAT=40.7128
-setEnv WEATHER_LON=-74.0060
-setEnv SMTP_HOST=mailpit
-setEnv SMTP_USER=weather@example.com
-setSecret SMTP_PASSWORD=any-password
```

- **Format:** `NAME=value` with **no spaces** around `=`.
- **Avoid `//` in passwords:** `//` starts a comment in broker commands and truncates the value.
- **Inspect:** View them in **Broker Settings → Variables & Secrets**, or run `-listEnv` and `-listSecrets` in Command Console.

### Initial heat limit (`30` °C)

In **Data Viewer → Publish** (paper-plane icon):
- **Topic:** `config/heat_limit_c`
- **Payload:** `30`
- **Retain:** **ON**

---

## 4. Lab notebooks overview

When `load-project` finishes at startup, the broker holds the `weather-station` project (added with `-addProject`, not loaded, so nothing is deployed). In **LoT Editor**, right-click `weather-station` → **Pull project from broker** once; the 8 notebooks then appear under `project/`:

| Notebook | Lab | What is inside |
|---|---|---|
| `00-setup.lotnb` | Setup | Variables, secret, and initial `config/heat_limit_c` publish |
| `01-heartbeat.lotnb` | Lab 1 | `Heartbeat` Action (publishes `ok` every 5s) |
| `02-model-processweather.lotnb` | Lab 2 | `WeatherReading` Model + `ProcessWeather` Action |
| `03-campus-weather.lotnb` | Lab 3 | `CampusWeather` REST Connector + `RequestWeather` Action |
| `04-heat-alert-history-email.lotnb` | Lab 4 | `HeatAlert` Action + `WeatherHistory` CSV Connector + `HeatMail` Email Connector |
| `05-rules.lotnb` | Lab 5 | `ProtectWeatherConfig` Rule |
| `06-panel.lotnb` | Lab 6 | `CampusWeather` Dashboard Panel |
| `07-stretch.lotnb` | Stretch | 6 optional challenges and hints |

### Deploying cells

- **In the HUB:** Open a notebook in **LoT Editor** and click **▷** on a cell (or **Deploy All** at the top right of the notebook). Re-running a cell updates that entity in place.
- **Via raw MQTT commands** (if using an external MQTT client as `root`, publishing to `$SYS/Coreflux/Command` and reading `$SYS/Coreflux/Command/Output`):

| LoT definition | Broker command |
|---|---|
| `DEFINE MODEL …` | `-addModel <code…>` |
| `DEFINE ACTION …` | `-addAction <code…>` |
| `DEFINE CONNECTOR …` | `-addConnector <code…>` |
| `DEFINE RULE …` | `-addRule <code…>` (remove existing first with `-removeRule <Name>`) |
| `DEFINE PANEL …` | `-addPanel <code…>` |

---

## 5. Mounted folders and files

- **`templates/heat-alert.html`** → mounted at `/templates/heat-alert.html` inside the broker. Used by the `HeatMail` Connector for the HTML email body. *(If missing, the broker sends the raw JSON payload as the email body without raising an error.)*
- **`exports/campus-weather.csv`** → mounted at `/data/exports/campus-weather.csv` inside the broker. Created and appended to by the `WeatherHistory` Connector on every reading.

---

## 6. End-to-end verification checklist

1. **Heartbeat:** In **Data Viewer**, `campus/weather/heartbeat` receives `ok` every 5 seconds.
2. **Weather poll:** Publish `poll` to `campus/weather/request`. Within a few seconds:
   - `campus/weather/raw` receives the Open-Meteo JSON response.
   - `campus/weather/reading` receives the converted `WeatherReading` JSON.
   - `campus/weather/alerts/heat_active` shows `off`.
   - `project/exports/campus-weather.csv` gains a new row.
3. **Heat alert & email:** Publish `1` (Retain **ON**) to `config/heat_limit_c`, then publish `poll` to `campus/weather/request`:
   - `campus/weather/alerts/heat_active` switches to `on`.
   - `campus/weather/alerts/heat` receives the reading.
   - Mailpit (http://localhost:8025) receives one *Campus heat alert* email.
   - Publishing `poll` a second time sends **no** second email (same heat episode).
4. **Reset:** Publish `30` (Retain **ON**) to `config/heat_limit_c`, then `poll` — `heat_active` switches back to `off`.
5. **Dashboard:** Open **Dashboards → Campus Weather** in the HUB to see °C, °F, wind speed, and heat alert status update live.
