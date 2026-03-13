<div align="center">

# OpenClaw Switch to Crazyrouter

### One-Click Switch OpenClaw to Crazyrouter, Access 300+ AI Models

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey.svg)](https://github.com/xujfcn/openclaw-switch)

English | [中文](README_ZH.md)

</div>

## ❤️ Sponsor

<details open>
<summary>Click to collapse</summary>

<table>
<tr>
<td width="180"><a href="https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch"><img src="https://crazyrouter.com/logo.png" alt="Crazyrouter" width="150"></a></td>
<td><strong>Crazyrouter</strong> is a high-performance AI API aggregation platform — one API key for 300+ models including GPT-4o, Claude 3.5, Gemini 2.0, DeepSeek, and more. All models at 55% of official pricing with auto-failover, smart routing, and unlimited concurrency. Register via <a href="https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch">this link</a> to get <strong>$2 free credit</strong> instantly, plus enter promo code <code>OPENCLAW</code> on your first top-up for an extra <strong>30% bonus credit</strong>!</td>
</tr>
</table>

</details>

---

## 📖 Introduction

This project provides one-click scripts to help [OpenClaw](https://openclaw.ai) users quickly switch to [Crazyrouter](https://crazyrouter.com) and enjoy unified AI model access.

**Crazyrouter** is an AI model API aggregation gateway providing unified access to 300+ AI models:

### 🤖 Chat Models
- **OpenAI**: GPT-4o, GPT-4o-mini, o1, o1-mini
- **Anthropic**: Claude 3.5 Sonnet, Claude 3.5 Haiku, Claude 3 Opus
- **Google**: Gemini 2.0 Flash, Gemini 1.5 Pro
- **DeepSeek**: DeepSeek Chat, DeepSeek Reasoner
- **Chinese Models**: Qwen, ERNIE, Doubao, GLM

### 🎨 Image Generation
- DALL-E 3, Midjourney, Flux, Ideogram, Stable Diffusion

### 🎬 Video Generation
- Sora-2, Kling, Luma, Runway, Veo, MiniMax

### 🎵 Audio Processing
- Whisper (Speech Recognition), TTS (Text-to-Speech), Suno (Music Generation)

---

## 🚀 Quick Start

### Method 1: One-Click Install (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash -s YOUR_API_KEY
```

**Replace `YOUR_API_KEY` with your Crazyrouter API Key**

### Method 2: Download and Run

```bash
# Download script
curl -O https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh
chmod +x openclaw-setup.sh

# Run
./openclaw-setup.sh sk-xxxxxxxxxxxxx
```

---

## 📋 Requirements

- ✅ OpenClaw installed
  ```bash
  npm install -g openclaw
  ```
- ✅ Crazyrouter API Key ([Get it here](https://crazyrouter.com))
- ✅ Linux or macOS (Windows requires WSL or Git Bash)

---

## ✨ Features

- 🔍 **Auto-detect** OpenClaw installation
- 💾 **Auto-backup** existing configuration
- ⚙️ **Smart config** Dynamic or static configuration
- 🎯 **Pre-configured models** Popular AI models ready to use
- ✅ **Connection verification** Ensure API setup success
- 🔄 **Auto-restart** Gateway applies new config
- 🎨 **User-friendly** Colorful output, clear messages

---

## 🎯 Pre-configured Models

| Model | Description | Use Case |
|-------|-------------|----------|
| `gpt-4o` | OpenAI's most capable multimodal model | Complex reasoning, code generation |
| `gpt-4o-mini` | Fast response version | Daily chat, quick tasks |
| `claude-3-5-sonnet-20241022` | Anthropic's flagship model | Long text, code review |
| `claude-3-5-haiku-20241022` | Fast Claude model | Quick response, light tasks |
| `gemini-2.0-flash-exp` | Google's latest experimental | Multimodal understanding |
| `deepseek-chat` | DeepSeek chat model | Chinese chat, programming |
| `deepseek-reasoner` | DeepSeek reasoning model | Complex reasoning, math |

**View full model list:** https://docs.crazyrouter.com

---

## 📂 Project Files

```
openclaw-switch/
├── openclaw-setup.sh          # Simplified one-click script (Recommended)
├── switch-to-crazyrouter.sh   # Full version with detailed logging
├── README.md                  # Project documentation (English)
├── README_ZH.md               # Project documentation (Chinese)
├── DETAILED_GUIDE.md          # Detailed usage guide
└── LICENSE                    # MIT License
```

---

## 🔧 Manual Configuration (Optional)

If you prefer manual configuration, edit `~/.openclaw/config.json`:

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

Then restart Gateway:
```bash
openclaw gateway restart
```

---

## 🔄 Restore Original Config

Script automatically backs up config to:
```
~/.openclaw/config.json.backup.YYYYMMDD_HHMMSS
```

Restore method:
```bash
cp ~/.openclaw/config.json.backup.20260313_123456 ~/.openclaw/config.json
openclaw gateway restart
```

---

## ❓ FAQ

<details>
<summary><strong>Is the script safe?</strong></summary>

The script is fully open source. You can review the code before running. It only modifies OpenClaw config files, no system-level operations.

</details>

<details>
<summary><strong>Will it overwrite my existing config?</strong></summary>

No. The script backs up your existing config first, then merges the new config. Other settings remain unchanged.

</details>

<details>
<summary><strong>Does it support Windows?</strong></summary>

Requires WSL (Windows Subsystem for Linux) or Git Bash environment.

</details>

<details>
<summary><strong>How to verify successful configuration?</strong></summary>

The script automatically tests API connection after running. A ✓ indicates success.

</details>

<details>
<summary><strong>Can I add more models?</strong></summary>

Yes! Manually edit the config file to add models, or check [Crazyrouter docs](https://docs.crazyrouter.com) for the complete model list.

</details>

<details>
<summary><strong>How to switch back to official config?</strong></summary>

Restore from backup file, or re-run OpenClaw's initialization process.

</details>

---

## 📚 Related Links

- **Crazyrouter Website**: https://crazyrouter.com
- **API Documentation**: https://docs.crazyrouter.com
- **OpenClaw Website**: https://openclaw.ai
- **OpenClaw Documentation**: https://docs.openclaw.ai
- **Get API Key**: https://crazyrouter.com/dashboard

---

## 🤝 Contributing

Issues and Pull Requests are welcome!

Before submitting a PR, please ensure:
- Code is properly formatted
- Passes basic tests
- Includes necessary documentation

---

## 📄 License

MIT License - See [LICENSE](LICENSE) file for details

---

## 📞 Support

For questions, please contact:
- **Telegram**: @crazyrouter
- **Email**: support@crazyrouter.com
- **GitHub Issues**: https://github.com/xujfcn/openclaw-switch/issues

---

<div align="center">

**Enjoy unified access to 300+ AI models!** 🚀

Made with ❤️ by [Crazyrouter](https://crazyrouter.com)

</div>
