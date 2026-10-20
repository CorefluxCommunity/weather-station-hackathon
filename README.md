# Weather station hackathon (Language of Things)

Build a live campus weather station that runs entirely inside one Coreflux Broker: it asks a
weather API for your site, converts the units, raises a heat alert, keeps a CSV history, emails
the team once per heat episode and shows a live dashboard in the Coreflux HUB.

- **Start here:** [HACKATHON.md](HACKATHON.md): the labs, step by step, with screenshots.
- **Setup and reference:** [project/README.md](project/README.md).
- **Slides:** open [index.html](index.html) in a browser.
- **Notebooks and Docker setup:** [project/](project/).

Needs Docker, Coreflux Broker 2.21.22 or later and HUB 2.11.4 or later (both started by
`project/docker-compose.yml`). About 3 hours for the core labs.

## Get the lesson

1. `git clone https://github.com/CorefluxCommunity/weather-station-hackathon.git`, or **Code →
   Download ZIP** on this page.
2. `cd weather-station-hackathon/project` and `docker compose up -d`, then open http://localhost:3000.
3. In the HUB, open **LoT Editor**, right-click *Untitled* → **Import .lotnb** and import the
   notebooks from `project/`. In VS Code, use **Git: Clone** and the **LoT Notebooks** extension.

Details in [HACKATHON.md](HACKATHON.md#get-the-lesson).

## Licence

GPL-3.0, see [LICENSE](LICENSE).
