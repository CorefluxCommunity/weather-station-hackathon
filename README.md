# Weather station hackathon (Language of Things)

<img src="https://assets.coreflux.org/brand/v1/corefluxLogo_corefluxLogoHorizontalOrange.png" alt="Coreflux" width="280">

Build a live campus weather station that runs entirely inside one Coreflux Broker: it asks a
weather API for your site, converts the units, raises a heat alert, keeps a CSV history, emails
the team once per heat episode and shows a live dashboard in the Coreflux HUB.

- **Prerequisites:** [PREREQUISITES.md](PREREQUISITES.md). Install Docker and Docker Compose before the labs.
- **Start here:** [HACKATHON.md](HACKATHON.md): the labs, step by step, with screenshots.
- **Platform overview:** after cloning the lesson into the HUB, click `index.html` in the LoT Editor. Walkthrough in [HACKATHON.md](HACKATHON.md#platform-overview).
- **Setup and reference:** [project/README.md](project/README.md).
- **Notebooks and Docker setup:** [project/](project/).
- **VS Code:** install [LoT Notebooks v1.0.0](vscode/vscode-lot-notebooks-1.0.0.vsix). Steps in [vscode/README.md](vscode/README.md).

## Get the lesson

1. `git clone https://github.com/CorefluxCommunity/weather-station-hackathon.git`, or **Code →
   Download ZIP** on this page. This local copy is what starts Docker.
2. `cd weather-station-hackathon/project` and `docker compose up -d`, then open http://localhost:3000.
3. In the HUB, **LoT Editor → New → From git…** clones this repository from GitHub. The notebooks
   and `index.html` appear in the tree. Click `index.html` for the platform overview. In VS Code,
   install [LoT Notebooks v1.0.0](vscode/vscode-lot-notebooks-1.0.0.vsix) ([steps](vscode/README.md)),
   then **Git: Clone** this repository.

Details in [HACKATHON.md](HACKATHON.md#get-the-lesson).

## Licence

GPL-3.0, see [LICENSE](LICENSE).
