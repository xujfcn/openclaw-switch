# Windows Usage

## Run the PowerShell script

```powershell
powershell -ExecutionPolicy Bypass -File .\switch-openclaw-to-crazyrouter.ps1
```

## What it does
- checks OpenClaw installation
- asks for your Crazyrouter API key
- backs up `%USERPROFILE%\\.openclaw\\config.json`
- writes a Crazyrouter-compatible config
- tries to restart the OpenClaw gateway
- verifies the API connection

## Notes
- Run PowerShell as your normal user first
- If OpenClaw is not installed, install it with:

```powershell
npm install -g openclaw
```

- If PowerShell blocks script execution, the command above already uses `-ExecutionPolicy Bypass`
