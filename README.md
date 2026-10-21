# Weather station hackathon (Language of Things)

<img src="https://assets.coreflux.org/brand/v1/corefluxLogo_corefluxLogoHorizontalOrange.png" alt="Coreflux" width="280">

Build a live campus weather station that runs entirely inside one Coreflux Broker: it asks a
weather API for your site, converts the units, raises a heat alert, keeps a CSV history, emails
the team once per heat episode and shows a live dashboard in the Coreflux HUB.

- **Start here:** [HACKATHON.md](HACKATHON.md): the labs, step by step, with screenshots.
- **Platform overview:** after cloning the lesson into the HUB, click `index.html` in the LoT Editor. Walkthrough in [HACKATHON.md](HACKATHON.md#platform-overview).
- **Setup and reference:** [project/README.md](project/README.md).
- **Notebooks and Docker setup:** [project/](project/).

## Prerequisites

About **2 hours** for the core labs.

You need Docker and Docker Compose, a web browser, and internet access the first time you start
(Docker downloads the images; later the broker calls the weather API).

**Coreflux Broker 2.22 or later** and **HUB 2.12 or later** are not installed by hand. Both are
started by [`project/docker-compose.yml`](project/docker-compose.yml), together with Mailpit (a test
inbox).

### Install Docker and Docker Compose

Docker runs the broker, the HUB and Mailpit as containers. Docker Compose starts all three with one
command. The lesson uses Compose v2: `docker compose` (a space), not the older `docker-compose`.

Check what you already have. In a terminal:

```bash
docker --version
docker compose version
```

Both commands should print a version. `docker compose version` should say `Docker Compose version v2…`.

| System | How to install |
|---|---|
| Windows | [Docker Desktop for Windows](https://docs.docker.com/desktop/setup/install/windows-install/). It includes Docker Compose. Start Docker Desktop and wait until it says it is running. |
| macOS | [Docker Desktop for Mac](https://docs.docker.com/desktop/setup/install/mac-install/) (Apple silicon or Intel). It includes Docker Compose. Start Docker Desktop and wait until it says it is running. |
| Linux | [Docker Engine](https://docs.docker.com/engine/install/) and the [Docker Compose plugin](https://docs.docker.com/compose/install/linux/). |

The overview of every platform is [Get Docker](https://docs.docker.com/get-started/get-docker/).

If a check fails:

- **`docker: command not found`.** Docker is not installed, or this terminal was opened before the
  install finished. Install from the table above, then open a new terminal.
- **`Cannot connect to the Docker daemon`.** Start Docker Desktop (Windows and macOS) or the Docker
  service (Linux), then run the check again.
- **`docker compose` is not a command, but `docker-compose` is.** That is Compose v1. Update Docker
  Desktop, or on Linux install the Compose plugin. The lesson's commands are `docker compose`.

## Get the lesson

1. `git clone https://github.com/CorefluxCommunity/weather-station-hackathon.git`, or **Code →
   Download ZIP** on this page. This local copy is what starts Docker.
2. `cd weather-station-hackathon/project` and `docker compose up -d`, then open http://localhost:3000.
3. In the HUB, **LoT Editor → New → From git…** clones this repository from GitHub. The notebooks
   and `index.html` appear in the tree. Click `index.html` for the platform overview. In VS Code,
   use **Git: Clone** and the **LoT Notebooks** extension.

Details in [HACKATHON.md](HACKATHON.md#get-the-lesson).

## Licence

GPL-3.0, see [LICENSE](LICENSE).
