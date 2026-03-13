# OpenClaw Switch to Crazyrouter

🚀 一键将 OpenClaw 切换到 Crazyrouter，访问 300+ AI 模型

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

---

## 📖 简介

这个项目提供了一键脚本，让已安装 [OpenClaw](https://openclaw.ai) 的用户可以快速切换到 [Crazyrouter](https://crazyrouter.com)，享受统一的 AI 模型访问体验。

**Crazyrouter** 是一个 AI 模型 API 聚合网关，提供对 300+ AI 模型的统一访问接口，包括：
- OpenAI (GPT-4o, GPT-4o-mini)
- Anthropic (Claude 3.5 Sonnet, Haiku)
- Google (Gemini 2.0 Flash)
- DeepSeek (Chat, Reasoner)
- 图像生成 (DALL-E, Midjourney, Flux, Ideogram)
- 视频生成 (Sora, Kling, Luma, Runway)
- 音频处理 (Whisper, TTS, Suno)

---

## 🚀 快速开始

### 方法 1：一键安装（推荐）

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash -s YOUR_API_KEY
```

**替换 `YOUR_API_KEY` 为你的 Crazyrouter API Key**

### 方法 2：下载后运行

```bash
# 下载脚本
curl -O https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh
chmod +x openclaw-setup.sh

# 运行
./openclaw-setup.sh sk-xxxxxxxxxxxxx
```

---

## 📋 前置要求

- ✅ 已安装 OpenClaw
  ```bash
  npm install -g openclaw
  ```
- ✅ 有 Crazyrouter API Key（[获取地址](https://crazyrouter.com)）
- ✅ Linux 或 macOS 系统（Windows 需要 WSL 或 Git Bash）

---

## ✨ 功能特性

- 🔍 **自动检测** OpenClaw 安装状态
- 💾 **自动备份** 现有配置文件
- ⚙️ **智能配置** 动态或静态配置方式
- 🎯 **预置模型** 自动配置常用 AI 模型
- ✅ **验证连接** 确保 API 配置成功
- 🔄 **自动重启** Gateway 应用新配置
- 🎨 **友好界面** 彩色输出，清晰易读

---

## 🎯 配置后可用模型

| 模型 | 说明 |
|------|------|
| `gpt-4o` | OpenAI 最强多模态模型 |
| `gpt-4o-mini` | 快速响应版本 |
| `claude-3-5-sonnet-20241022` | Anthropic 旗舰模型 |
| `claude-3-5-haiku-20241022` | 快速 Claude 模型 |
| `gemini-2.0-flash-exp` | Google 最新实验版 |
| `deepseek-chat` | DeepSeek 对话模型 |
| `deepseek-reasoner` | DeepSeek 推理模型 |

**查看完整模型列表：** https://docs.crazyrouter.com

---

## 📂 项目文件

- **`openclaw-setup.sh`** - 简化版一键安装脚本（推荐）
- **`switch-to-crazyrouter.sh`** - 完整版脚本（详细日志）
- **`README.md`** - 本文档
- **`DETAILED_GUIDE.md`** - 详细使用指南

---

## 🔧 手动配置

如果你想手动配置，编辑 `~/.openclaw/config.json`：

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

然后重启 Gateway：
```bash
openclaw gateway restart
```

---

## 🔄 恢复原配置

脚本会自动备份配置到：
```
~/.openclaw/config.json.backup.YYYYMMDD_HHMMSS
```

恢复方法：
```bash
cp ~/.openclaw/config.json.backup.20260313_123456 ~/.openclaw/config.json
openclaw gateway restart
```

---

## ❓ 常见问题

### Q: 脚本安全吗？
A: 脚本完全开源，可以先查看源码再运行。只修改 OpenClaw 配置文件，不涉及系统级操作。

### Q: 会覆盖我现有的配置吗？
A: 不会。脚本会先备份现有配置，然后合并新配置。其他设置不受影响。

### Q: 支持 Windows 吗？
A: 需要 WSL (Windows Subsystem for Linux) 或 Git Bash 环境。

### Q: 如何验证配置成功？
A: 脚本运行后会自动测试 API 连接，显示 ✓ 表示成功。

### Q: 可以添加更多模型吗？
A: 可以！手动编辑配置文件添加，或查看 [Crazyrouter 文档](https://docs.crazyrouter.com) 获取完整模型列表。

---

## 📚 相关链接

- **Crazyrouter 官网**: https://crazyrouter.com
- **API 文档**: https://docs.crazyrouter.com
- **OpenClaw 官网**: https://openclaw.ai
- **OpenClaw 文档**: https://docs.openclaw.ai
- **获取 API Key**: https://crazyrouter.com/dashboard

---

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

## 📄 许可证

MIT License

---

## 📞 支持

如有问题，请联系：
- **Telegram**: @crazyrouter
- **Email**: support@crazyrouter.com
- **GitHub Issues**: https://github.com/xujfcn/openclaw-switch/issues

---

**享受 300+ AI 模型的统一访问体验！** 🚀
