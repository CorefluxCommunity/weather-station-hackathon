# Coreflux Weather Station Hackathon

<img src="https://assets.coreflux.org/brand/v1/corefluxLogo_corefluxLogoHorizontalOrange.png" alt="Coreflux" width="280">

Welcome! In this hands-on workshop, you will build a complete, live **campus weather station** using **Coreflux** and **LoT (Language of Things)**.

No prior Coreflux or MQTT experience is required. Everything runs locally on your laptop in Docker, and you will build the system step by step in your browser.

---

## What you will build

All inside a single **Coreflux Broker**, your weather station will:

1. **Fetch live weather** for your coordinates from the [Open-Meteo API](https://open-meteo.com) every 60 seconds (or on demand).
2. **Validate and convert units** (°C to °F) into a structured `WeatherReading` JSON payload.
3. **Trigger a heat alert** whenever the temperature crosses a live threshold that operators can adjust on the fly.
4. **Log history to CSV** and **send an HTML email alert** (captured in a local test inbox) once per heat episode.
5. **Lock down configuration** so only `root` can change the heat threshold.
6. **Display a live dashboard** in the Coreflux HUB.

**Estimated time:** ~2 hours for the 6 core labs (plus optional stretch goals).

---

## Quick start (5 minutes)

### 1. Check Docker ([PREREQUISITES.md](PREREQUISITES.md))

You need **Docker** and **Docker Compose v2**, a **web browser**, and **internet access** (to pull the containers and query the weather API).

Open a terminal and check that Docker is installed and running:

```bash
docker --version
docker compose version
```

Both commands should print a version number (`Docker Compose version v2…`).

<details>
<summary><strong>Need to install or start Docker? Click here</strong></summary>

| OS | What to install |
|---|---|
| **Windows** | [Docker Desktop for Windows](https://docs.docker.com/desktop/setup/install/windows-install/) (includes Docker Compose). Start Docker Desktop and wait until it shows as running. |
| **macOS** | [Docker Desktop for Mac](https://docs.docker.com/desktop/setup/install/mac-install/) (Apple silicon or Intel; includes Docker Compose). Start Docker Desktop and wait until it shows as running. |
| **Linux** | [Docker Engine](https://docs.docker.com/engine/install/) + the [Docker Compose plugin](https://docs.docker.com/compose/install/linux/). |

**Common issues:**
- **`docker: command not found`** — Install Docker from the links above, then open a **new** terminal window.
- **`Cannot connect to the Docker daemon`** — Start the Docker Desktop app (Windows/macOS) or the Docker service (Linux) and try again.
- **`docker compose` is not recognized, only `docker-compose`** — You have Compose v1. Update Docker Desktop or install the Compose v2 plugin so `docker compose` (with a space) works.

</details>

### 2. Download this repository

Clone the repository with Git (or click **Code → Download ZIP** on GitHub and unzip it):

```bash
git clone https://github.com/CorefluxCommunity/weather-station-hackathon.git
cd weather-station-hackathon/project
```

*(If you downloaded the ZIP, the folder is named `weather-station-hackathon-main/project`.)*

### 3. Start the environment

From inside the `project/` folder, start the containers and wait for the project loader to finish:

```bash
docker compose up -d
docker compose wait load-project
```

This starts three services in Docker and loads the workshop notebooks onto the broker:

| Service | URL / Address | What it is |
|---|---|---|
| **Coreflux HUB** | http://localhost:3000 | The web workspace where you write code, inspect data, and view dashboards |
| **Mailpit** | http://localhost:8025 | A local test email inbox that catches alert emails |
| **Coreflux Broker** | `localhost:1883` | The MQTT broker where your LoT code runs (`root` / `coreflux`) |

### 4. Open the HUB and begin

1. Open **http://localhost:3000** in your browser and click **Connect** (the connection details are pre-filled).
2. Open **[HACKATHON.md](HACKATHON.md)** and follow the guided steps from **Step 2** onward.

---

## Where to go in this repo

| File / Folder | What is inside |
|---|---|
| **[PREREQUISITES.md](PREREQUISITES.md)** | **Prerequisites.** Installing and verifying Docker and Docker Compose before the workshop. |
| **[HACKATHON.md](HACKATHON.md)** | **Main workshop guide.** Start-to-finish instructions, concepts, lab steps, screenshots, and troubleshooting. |
| **[index.html](index.html)** | **Interactive visual overview.** Animated slides explaining every Coreflux concept used in the labs. View it inside the HUB's LoT Editor or open it directly in your browser. |
| **[project/](project/)** | The 8 lab notebooks (`00-setup.lotnb` – `07-stretch.lotnb`), `docker-compose.yml`, HTML email template, and `exports/` folder. |
| **[project/README.md](project/README.md)** | **Quick reference & cheat sheet** for commands, environment variables, licensing, and resets. |
| **[vscode/README.md](vscode/README.md)** | Optional guide if you prefer running the `.lotnb` notebooks in **VS Code** instead of the HUB. |

## Licence

GPL-3.0 — see [LICENSE](LICENSE).
