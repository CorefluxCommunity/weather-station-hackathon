# Prerequisites

The core hackathon labs (Labs 1 to 6) take about **2 hours**, with optional stretch goals afterward.

## What you need

- **Docker** and **Docker Compose v2** (installation instructions below)
- A **web browser** (you will use the Coreflux HUB at `http://localhost:3000`)
- **Internet access** (to download the Docker images on first start and to call the Open-Meteo weather API)

> **No manual Coreflux install needed:** Both **Coreflux Broker 2.22+** and **Coreflux HUB 2.12+** are started automatically in Docker by [`project/docker-compose.yml`](project/docker-compose.yml), alongside Mailpit (a local test email inbox).

---

## Step 1: Check if Docker is already installed

Docker runs the Broker, HUB, and Mailpit as containers, and Docker Compose starts all of them with a single command. The workshop uses Compose v2 (`docker compose` with a space, not the older `docker-compose`).

Open a terminal and run:

```bash
docker --version
docker compose version
```

- Both commands should print a version number.
- `docker compose version` should show `Docker Compose version v2…`.

If both commands succeed, you are ready — jump straight to **[`HACKATHON.md`](HACKATHON.md)**!

---

## Step 2: Install Docker (if needed)

| Operating System | What to install |
|---|---|
| **Windows** | [Docker Desktop for Windows](https://docs.docker.com/desktop/setup/install/windows-install/) (includes Docker Compose). After installing, open **Docker Desktop** and wait until it shows as running. |
| **macOS** | [Docker Desktop for Mac](https://docs.docker.com/desktop/setup/install/mac-install/) (Apple silicon or Intel; includes Docker Compose). After installing, open **Docker Desktop** and wait until it shows as running. |
| **Linux** | [Docker Engine](https://docs.docker.com/engine/install/) and the [Docker Compose plugin](https://docs.docker.com/compose/install/linux/). |

*(See [Get Docker](https://docs.docker.com/get-started/get-docker/) for an overview of all platforms.)*

---

## Troubleshooting Docker checks

- **`docker: command not found`**
  Docker is not installed yet, or your terminal window was opened before the installation finished. Install Docker from the table above, then open a **new** terminal window and run the checks again.
- **`Cannot connect to the Docker daemon`**
  Docker is installed, but the background service is not running. Start the **Docker Desktop** app (Windows/macOS) or start the Docker service (Linux), wait until it is ready, and try again.
- **`docker compose` is not recognized, but `docker-compose` works**
  You have the older Compose v1 installed. Update Docker Desktop (Windows/macOS) or install the [Docker Compose v2 plugin](https://docs.docker.com/compose/install/linux/) (Linux).

---

Once both version checks pass, continue to **[`HACKATHON.md`](HACKATHON.md)**.
