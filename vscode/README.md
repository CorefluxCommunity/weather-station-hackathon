# Using VS Code with LoT Notebooks (Optional)

By default, all hackathon labs run in your browser inside the **Coreflux HUB** (`http://localhost:3000`).

If you prefer editing and running `.lotnb` notebooks in **VS Code**, this folder includes the packaged **LoT Notebooks v1.0.0** extension (`vscode-lot-notebooks-1.0.0.vsix`, from the [v1.0.0 release](https://github.com/CorefluxCommunity/VSCodeLotNotebook/releases/tag/v1.0.0) of [VSCodeLotNotebook](https://github.com/CorefluxCommunity/VSCodeLotNotebook)).

---

## Step 1: Start the broker first

Make sure the Docker environment is running before connecting from VS Code. From the `project/` folder:

```bash
docker compose up -d
docker compose wait load-project
```

---

## Step 2: Install the VS Code extension

Choose either the VS Code UI or the terminal:

### Option A: From the VS Code UI
1. Open VS Code.
2. Open the **Extensions** view (`Cmd+Shift+X` on macOS, `Ctrl+Shift+X` on Windows/Linux).
3. Click the **`…`** menu at the top right of the Extensions view and select **Install from VSIX…**.
4. Select `vscode/vscode-lot-notebooks-1.0.0.vsix` from this repository and reload VS Code if prompted.

### Option B: From the terminal
From the root of this repository, run:

```bash
code --install-extension vscode/vscode-lot-notebooks-1.0.0.vsix
```

---

## Step 3: Open the project and connect to the broker

1. In VS Code, open your local `weather-station-hackathon` folder (**File → Open Folder…**).
2. Open `project/01-heartbeat.lotnb`.
3. Connect the extension to your local broker using:
   - **Host:** `localhost`
   - **Port:** `1883`
   - **Username:** `root`
   - **Password:** `coreflux`
   *(See the [VS Code quick-start guide](https://docs.coreflux.org/latest/quick-start/vscode) for screenshots of the connection bar.)*

---

## Developing or modifying the extension (Contributors)

If you want to modify the VS Code extension itself while working through the labs, you can run v1.0.0 from source in an Extension Development Host instead of installing the VSIX:

```bash
git clone --branch v1.0.0 --depth 1 https://github.com/CorefluxCommunity/VSCodeLotNotebook.git
cd VSCodeLotNotebook
npm install
```

1. Open the `VSCodeLotNotebook` folder in VS Code and press **F5**.
2. A new **Extension Development Host** window opens with the extension loaded.
3. In that second window, open `weather-station-hackathon` and connect to `localhost:1883` (`root` / `coreflux`).
4. Run `npm run watch` to rebuild automatically as you edit. See [development.md](https://github.com/CorefluxCommunity/VSCodeLotNotebook/blob/v1.0.0/docs/development.md) for contributor notes.
