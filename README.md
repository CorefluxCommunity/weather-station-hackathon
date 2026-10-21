> **Stuck?** Give this repository link to your ChatGPT, Claude or Gemini and ask it for help: https://github.com/CorefluxCommunity/weather-station-hackathon

# Coreflux Weather Station Hackathon

<img src="https://assets.coreflux.org/brand/v1/corefluxLogo_corefluxLogoHorizontalOrange.png" alt="Coreflux" width="280">

Welcome! In this hands-on workshop, you will build a complete, live **campus weather station** using **Coreflux** and **LoT (Language of Things)**.

No prior Coreflux or MQTT experience is required. Everything runs locally on your laptop in Docker, and you will build the system step by step in your browser.

---

## Start here

Open **[HACKATHON.md](HACKATHON.md)** and follow it from the top. It takes you through everything else, in order: installing Docker, starting the environment, and the labs, step by step, with screenshots.

---

## Find out more

Optional. HACKATHON.md links to all of this when you need it.

### What you will build

All inside a single **Coreflux Broker**, your weather station will:

1. **Fetch live weather** for your coordinates from the [Open-Meteo API](https://open-meteo.com) every 5 minutes (or on demand).
2. **Validate and convert units** (°C to °F and km/h to mph) into a structured `WeatherReading` JSON payload.
3. **Trigger a heat alert** whenever the temperature crosses a live threshold that operators can adjust on the fly.
4. **Log history to CSV** and **send an HTML email alert** (captured in a local test inbox) once per heat episode.
5. **Lock down configuration** so only the `operators` group (and `root`) can change the heat threshold.
6. **Display a live dashboard** in the Coreflux HUB.

### Where to go in this repo

| File / Folder | What is inside |
|---|---|
| **[PREREQUISITES.md](PREREQUISITES.md)** | **Prerequisites.** Installing and verifying Docker and Docker Compose before the workshop. |
| **[HACKATHON.md](HACKATHON.md)** | **Main workshop guide.** Start-to-finish instructions, concepts, lab steps, screenshots, and troubleshooting. |
| **[index.html](index.html)** | **Interactive visual overview.** Animated slides explaining every Coreflux concept used in the labs. Open it directly in your browser. |
| **[project/](project/)** | The 8 lab notebooks (`00-setup.lotnb` – `07-stretch.lotnb`), `docker-compose.yml`, HTML email template, and `exports/` folder. |
| **[project/README.md](project/README.md)** | **Quick reference & cheat sheet** for commands, environment variables, licensing, and resets. |
| **[vscode/README.md](vscode/README.md)** | Optional guide if you prefer running the `.lotnb` notebooks in **VS Code** instead of the HUB. |

## Licence

GPL-3.0 — see [LICENSE](LICENSE).
