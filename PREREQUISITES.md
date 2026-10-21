# Prerequisites

About **2 hours** for the core labs (labs 1 to 6). Stretch goals are extra.

You need:

- **Docker** and **Docker Compose** (how to get them is below)
- a **web browser** (the HUB is at http://localhost:3000)
- **internet** the first time you start, so Docker can download the images, and later so the broker
  can call the weather API

**Coreflux Broker 2.22 or later** and **HUB 2.12 or later** are not installed by hand. Both are
started by [`project/docker-compose.yml`](project/docker-compose.yml), together with Mailpit (a test
inbox).

## Install Docker and Docker Compose

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

When both checks print a version, start the labs in [HACKATHON.md](HACKATHON.md).
