<div align="center">

# OpenClaw + Crazyrouter

### One-Click Setup: Access 300+ AI Models with OpenClaw

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

English | [中文](README.md)

</div>

---

## 🚀 One-Click Install

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash
```

**The script will prompt you to enter your Crazyrouter API Key**  
**Get API Key**: https://crazyrouter.com/dashboard

---

## 📖 What is this?

An interactive configuration script designed specifically for **OpenClaw** users to quickly switch to **Crazyrouter** API.

### Why Crazyrouter?

- ✅ **300+ AI Models** - One API key for all models
- ✅ **55% Off Official Pricing** - GPT-4o, Claude, Gemini, and more
- ✅ **Smart Routing** - Auto-failover, unlimited concurrency
- ✅ **Unified Interface** - OpenAI-compatible, no code changes needed

### Supported Models

| Type | Models |
|------|--------|
| 🤖 **Chat** | GPT-4o, Claude 3.5, Gemini 2.0, DeepSeek, Qwen, ERNIE |
| 🎨 **Image** | DALL-E 3, Midjourney, Flux, Ideogram, Stable Diffusion |
| 🎬 **Video** | Sora-2, Kling, Luma, Runway, Veo, MiniMax |
| 🎵 **Audio** | Whisper, TTS, Suno |

**Full list**: https://docs.crazyrouter.com

---

## ⚡ Quick Start

### 1. Install OpenClaw (if not already installed)

```bash
npm install -g openclaw
```

### 2. Run Setup Script

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash
```

### 3. Follow the Prompts

The script will interactively guide you:
- 📋 Display registration link and special offers
- 🔑 Prompt for API Key input
- ✅ Auto-validate format
- 🔄 Auto-configure and restart

### 4. Done!

The script will automatically:
- ✅ Backup existing config
- ✅ Configure Crazyrouter API
- ✅ Pre-configure 7 popular models
- ✅ Restart Gateway
- ✅ Verify connection

---

## 🎯 Pre-configured Models

The script automatically configures these models:

| Model ID | Description |
|----------|-------------|
| `gpt-4o` | OpenAI's most capable |
| `gpt-4o-mini` | Fast response version |
| `claude-3-5-sonnet-20241022` | Anthropic flagship |
| `claude-3-5-haiku-20241022` | Fast Claude |
| `gemini-2.0-flash-exp` | Google's latest |
| `deepseek-chat` | DeepSeek chat |
| `deepseek-reasoner` | DeepSeek reasoning |

---

## 🎬 Demo

```bash
$ curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash

╔════════════════════════════════════════════════════════════╗
║                                                            ║
║          OpenClaw + Crazyrouter Setup Script               ║
║                                                            ║
║          Access 300+ AI Models, 55% Off Official Price     ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝

🔍 Checking environment...
✓ Detected OpenClaw v1.2.3

🔑 Configure Crazyrouter API Key

If you don't have an API Key yet, visit:
  https://crazyrouter.com/dashboard

Special Offer:
  🎁 Register via this link to get $2 free credit
  🎁 Enter OPENCLAW on first top-up for 30% bonus
  https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch

Please enter your Crazyrouter API Key: sk-xxxxxxxxxxxxx

✓ API Key received

💾 Backing up existing config...
✓ Config backed up to: ~/.openclaw/config.json.backup.20260313_080000

⚙️  Configuring Crazyrouter...
✓ Updating config via Gateway API...
✓ Config applied, Gateway restarting...

✅ Verifying API connection...
✓ API connection successful

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                    🎉 Setup Complete!
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✨ Configured Models:

  🤖 Chat Models:
     • gpt-4o              (OpenAI's best)
     • gpt-4o-mini         (Fast response)
     • claude-3-5-sonnet   (Anthropic flagship)
     • claude-3-5-haiku    (Fast Claude)
     • gemini-2.0-flash    (Google's latest)
     • deepseek-chat       (DeepSeek chat)
     • deepseek-reasoner   (DeepSeek reasoning)

📚 View more models:
   https://docs.crazyrouter.com

Thank you for using Crazyrouter!
```

---

## 🔧 Manual Configuration (Optional)

If you prefer manual setup, edit `~/.openclaw/config.json`:

```json
{
  "llm": {
    "providers": [
      {
        "id": "crazyrouter",
        "type": "openai",
        "baseUrl": "https://crazyrouter.com/v1",
        "apiKey": "YOUR_API_KEY"
      }
    ],
    "models": [
      {
        "id": "gpt-4o",
        "provider": "crazyrouter",
        "name": "gpt-4o"
      }
    ]
  }
}
```

Restart Gateway:
```bash
openclaw gateway restart
```

---

## 🔄 Restore Original Config

Config is automatically backed up to:
```
~/.openclaw/config.json.backup.YYYYMMDD_HHMMSS
```

Restore:
```bash
cp ~/.openclaw/config.json.backup.20260313_080000 ~/.openclaw/config.json
openclaw gateway restart
```

---

## ❓ FAQ

**Q: Is the script safe?**  
A: Fully open source, only modifies OpenClaw config files.

**Q: Will it overwrite my config?**  
A: No, it backs up first then merges.

**Q: Windows support?**  
A: Requires WSL or Git Bash.

**Q: How to add more models?**  
A: Edit config manually or check [docs](https://docs.crazyrouter.com).

**Q: What's the API Key format?**  
A: Usually starts with `sk-`, the script auto-validates format.

---

## 📚 Links

- **Crazyrouter**: https://crazyrouter.com
- **API Docs**: https://docs.crazyrouter.com
- **OpenClaw**: https://openclaw.ai
- **Get API Key**: https://crazyrouter.com/dashboard

---

## 💰 Special Offer

Register via [this link](https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch):
- 🎁 **$2 free credit**
- 🎁 Enter `OPENCLAW` on first top-up for **30% bonus**

---

## 📄 License

MIT License

---

<div align="center">

**Access 300+ AI Models with OpenClaw!** 🚀

Made with ❤️ by [Crazyrouter](https://crazyrouter.com)

</div>
