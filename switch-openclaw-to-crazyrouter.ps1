# Windows PowerShell script for switching OpenClaw to Crazyrouter
# Usage: powershell -ExecutionPolicy Bypass -File .\switch-openclaw-to-crazyrouter.ps1

$ErrorActionPreference = 'Stop'

function Write-Info($msg) { Write-Host "[INFO] $msg" -ForegroundColor Green }
function Write-Warn($msg) { Write-Host "[WARN] $msg" -ForegroundColor Yellow }
function Write-ErrorMsg($msg) { Write-Host "[ERROR] $msg" -ForegroundColor Red }

Write-Host ""
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host " OpenClaw + Crazyrouter Setup for Windows" -ForegroundColor Cyan
Write-Host "============================================================" -ForegroundColor Cyan
Write-Host ""

if (-not (Get-Command openclaw -ErrorAction SilentlyContinue)) {
    Write-ErrorMsg "OpenClaw is not installed or not in PATH."
    Write-Host "Install first with: npm install -g openclaw"
    exit 1
}

try {
    $ocVersion = & openclaw --version
    Write-Info "Detected OpenClaw $ocVersion"
} catch {
    Write-Warn "Could not determine OpenClaw version, continuing..."
}

Write-Host "Get your Crazyrouter API key at: https://crazyrouter.com/dashboard" -ForegroundColor Cyan
$apiKey = Read-Host "Enter your Crazyrouter API Key"

if ([string]::IsNullOrWhiteSpace($apiKey)) {
    Write-ErrorMsg "API key cannot be empty."
    exit 1
}

if (-not $apiKey.StartsWith('sk-')) {
    $continue = Read-Host "API key does not start with sk-. Continue anyway? (y/n)"
    if ($continue -ne 'y' -and $continue -ne 'Y') {
        exit 1
    }
}

$configDir = Join-Path $HOME '.openclaw'
$configFile = Join-Path $configDir 'config.json'
New-Item -ItemType Directory -Force -Path $configDir | Out-Null

if (Test-Path $configFile) {
    $timestamp = Get-Date -Format 'yyyyMMdd_HHmmss'
    $backupFile = "$configFile.backup.$timestamp"
    Copy-Item $configFile $backupFile -Force
    Write-Info "Backed up config to: $backupFile"
} else {
    Write-Warn "No existing config found, a new one will be created."
}

$configObject = @{
    llm = @{
        providers = @(
            @{
                id = 'crazyrouter'
                type = 'openai'
                baseUrl = 'https://crazyrouter.com/v1'
                apiKey = $apiKey
            }
        )
        models = @(
            @{ id = 'gpt-4o'; provider = 'crazyrouter'; name = 'gpt-4o' },
            @{ id = 'gpt-4o-mini'; provider = 'crazyrouter'; name = 'gpt-4o-mini' },
            @{ id = 'claude-sonnet-4-6'; provider = 'crazyrouter'; name = 'claude-sonnet-4-6' },
            @{ id = 'claude-opus-4-6'; provider = 'crazyrouter'; name = 'claude-opus-4-6' },
            @{ id = 'gemini-2.0-flash-exp'; provider = 'crazyrouter'; name = 'gemini-2.0-flash-exp' },
            @{ id = 'deepseek-chat'; provider = 'crazyrouter'; name = 'deepseek-chat' },
            @{ id = 'deepseek-reasoner'; provider = 'crazyrouter'; name = 'deepseek-reasoner' }
        )
    }
}

$configJson = $configObject | ConvertTo-Json -Depth 8
Set-Content -Path $configFile -Value $configJson -Encoding UTF8
Write-Info "Config written to $configFile"

try {
    & openclaw gateway restart
    Write-Info "OpenClaw gateway restarted"
} catch {
    Write-Warn "Gateway restart failed, trying to start it..."
    try {
        & openclaw gateway start
        Write-Info "OpenClaw gateway started"
    } catch {
        Write-Warn "Could not auto-start gateway. You may need to run 'openclaw gateway start' manually."
    }
}

try {
    $headers = @{ Authorization = "Bearer $apiKey" }
    $resp = Invoke-RestMethod -Uri 'https://crazyrouter.com/v1/models' -Headers $headers -Method Get
    if ($resp) {
        Write-Info "Crazyrouter API connection verified successfully"
    }
} catch {
    Write-Warn "Config applied, but API verification failed. Please check your key."
}

Write-Host ""
Write-Host "============================================================" -ForegroundColor Green
Write-Host " Setup complete! OpenClaw is now configured for Crazyrouter" -ForegroundColor Green
Write-Host "============================================================" -ForegroundColor Green
Write-Host ""
Write-Host "Configured models:" -ForegroundColor Cyan
Write-Host " - gpt-5.4 (primary)"
Write-Host " - claude-sonnet-4-6 (secondary)"
Write-Host " - claude-opus-4-6"
Write-Host " - gpt-4o"
Write-Host " - gpt-4o-mini"
Write-Host " - gemini-2.0-flash-exp"
Write-Host " - deepseek-chat"
Write-Host " - deepseek-reasoner"
Write-Host ""
Write-Host "Docs: https://docs.crazyrouter.com" -ForegroundColor Cyan
ter.com" -ForegroundColor Cyan
