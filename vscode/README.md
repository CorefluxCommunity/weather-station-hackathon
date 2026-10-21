# LoT Notebooks for VS Code (v1.0.0)

The labs run in the HUB. VS Code is the other editor. This folder ships the extension that opens the notebooks.

The file `vscode-lot-notebooks-1.0.0.vsix` is the [v1.0.0 release](https://github.com/CorefluxCommunity/VSCodeLotNotebook/releases/tag/v1.0.0) of [VSCodeLotNotebook](https://github.com/CorefluxCommunity/VSCodeLotNotebook).

Start the broker first (`docker compose up -d` in `project/`). The extension connects to `localhost:1883` as `root` / `coreflux`.

## Install the extension

1. Open VS Code.
2. Open the Extensions view (Shift+Command+X on macOS, Shift+Ctrl+X on Windows and Linux).
3. Open the `…` menu at the top of that view and choose **Install from VSIX…**.
4. Pick `vscode/vscode-lot-notebooks-1.0.0.vsix` from this repository.

Or, from the repository root:

```bash
code --install-extension vscode/vscode-lot-notebooks-1.0.0.vsix
```

Reload VS Code if it asks. Then **Git: Clone** this lesson, open `project/01-heartbeat.lotnb`, and connect to the broker. The connection steps are in the [VS Code guide](https://docs.coreflux.org/latest/quick-start/vscode).

## Development

Use this when you want to change the extension while you run the lesson. It loads the same v1.0.0 source in an Extension Development Host, instead of the VSIX above.

```bash
git clone --branch v1.0.0 --depth 1 https://github.com/CorefluxCommunity/VSCodeLotNotebook.git
cd VSCodeLotNotebook
npm install
```

Open that folder in VS Code and press **F5**. A second window opens with the extension loaded. In that window, open this lesson and connect to `localhost:1883` as `root` / `coreflux`.

`npm run watch` rebuilds the extension while you edit. Contributor notes are in [development.md](https://github.com/CorefluxCommunity/VSCodeLotNotebook/blob/v1.0.0/docs/development.md) on that tag.
