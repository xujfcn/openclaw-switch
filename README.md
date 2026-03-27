<div align="center">

# OpenClaw + Crazyrouter

### 一键配置脚本：让 OpenClaw 访问 300+ AI 模型

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey.svg)](https://github.com/xujfcn/openclaw-switch)

[English](README_EN.md) | 中文

</div>

---

## 🚀 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash
```

**脚本会提示你输入 Crazyrouter API Key**  
**获取 API Key**: https://crazyrouter.com/dashboard

---

## 📖 这是什么？

这是一个专为 **OpenClaw** 用户设计的交互式配置脚本，帮助你快速切换到 **Crazyrouter** API。

### 为什么使用 Crazyrouter？

- ✅ **300+ AI 模型** - 一个 API Key 访问所有模型
- ✅ **官方 55% 折扣** - GPT-4o、Claude、Gemini 等全部模型
- ✅ **智能路由** - 自动故障转移，无限并发
- ✅ **统一接口** - 兼容 OpenAI 格式，无需修改代码

### 支持的模型

| 类型 | 模型 |
|------|------|
| 🤖 **聊天** | GPT-4o, Claude 3.5, Gemini 2.0, DeepSeek, 通义千问, 文心一言 |
| 🎨 **图像** | DALL-E 3, Midjourney, Flux, Ideogram, Stable Diffusion |
| 🎬 **视频** | Sora-2, Kling, Luma, Runway, Veo, MiniMax |
| 🎵 **音频** | Whisper, TTS, Suno |

**完整列表**: https://docs.crazyrouter.com

---

## 💻 系统要求

- ✅ **Linux**: Ubuntu 20.04+, Debian 11+, CentOS 8+, Fedora 34+
- ✅ **macOS**: macOS 10.15 (Catalina) 及以上
- ⚠️ **Windows**: 需要 WSL (Windows Subsystem for Linux) 或 Git Bash

---

## ⚡ 快速开始

### 1. 安装 OpenClaw（如果还没安装）

**Linux / macOS:**
```bash
npm install -g openclaw
```

**macOS (Homebrew):**
```bash
brew tap openclaw/openclaw
brew install openclaw
```

**Windows (PowerShell):**
```powershell
npm install -g openclaw
```

### 2. 运行配置脚本

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash
```

### 3. 按提示输入 API Key

脚本会交互式地引导你：
- 📋 显示注册链接和优惠信息
- 🔑 提示输入 API Key
- ✅ 自动验证格式
- 🔄 自动配置并重启

### 4. 完成！

脚本会自动：
- ✅ 备份现有配置
- ✅ 配置 Crazyrouter API
- ✅ 预置 7 个常用模型
- ✅ 重启 Gateway
- ✅ 验证连接

---

## 🎯 预配置模型

脚本会自动配置以下模型：

| 模型 ID | 说明 |
|---------|------|
| `gpt-5.4` | 主力默认模型 |
| `claude-sonnet-4-6` | 次主力模型 |
| `claude-opus-4-6` | 高质量复杂任务 |
| `gpt-4o` | OpenAI 多模态 |
| `gpt-4o-mini` | 快速响应版本 |
| `gemini-2.0-flash-exp` | Google 最新 |
| `deepseek-chat` | DeepSeek 对话 |
| `deepseek-reasoner` | DeepSeek 推理 |

---

## 🎬 使用演示

```bash
$ curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash

╔════════════════════════════════════════════════════════════╗
║                                                            ║
║          OpenClaw + Crazyrouter 一键配置脚本               ║
║                                                            ║
║          访问 300+ AI 模型，官方价格 55% 折扣              ║
║                                                            ║
╚════════════════════════════════════════════════════════════╝

🔍 检查环境...
✓ 检测到 OpenClaw v1.2.3

🔑 配置 Crazyrouter API Key

如果还没有 API Key，请访问：
  https://crazyrouter.com/dashboard

注册优惠：
  🎁 通过此链接注册获得 $2 免费额度
  🎁 首充输入 OPENCLAW 获得 30% 奖励
  https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch

请输入你的 Crazyrouter API Key: sk-xxxxxxxxxxxxx

✓ API Key 已接收

💾 备份现有配置...
✓ 配置已备份到: ~/.openclaw/config.json.backup.20260313_080000

⚙️  配置 Crazyrouter...
✓ 通过 Gateway API 更新配置...
✓ 配置已应用，Gateway 正在重启...

✅ 验证 API 连接...
✓ API 连接成功

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
                    🎉 配置完成！
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

✨ 已配置的模型：

  🤖 聊天模型：
     • gpt-4o              (OpenAI 最强)
     • gpt-4o-mini         (快速响应)
     • claude-3-5-sonnet   (Anthropic 旗舰)
     • claude-3-5-haiku    (快速 Claude)
     • gemini-2.0-flash    (Google 最新)
     • deepseek-chat       (DeepSeek 对话)
     • deepseek-reasoner   (DeepSeek 推理)

📚 查看更多模型：
   https://docs.crazyrouter.com

感谢使用 Crazyrouter！
```

---

## 🔧 手动配置（可选）

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

重启 Gateway：
```bash
openclaw gateway restart
```

---

## 🔄 恢复原配置

配置会自动备份到：
```
~/.openclaw/config.json.backup.YYYYMMDD_HHMMSS
```

恢复：
```bash
cp ~/.openclaw/config.json.backup.20260313_080000 ~/.openclaw/config.json
openclaw gateway restart
```

---

## ❓ 常见问题

**Q: 脚本安全吗？**  
A: 完全开源，只修改 OpenClaw 配置文件。

**Q: 会覆盖现有配置吗？**  
A: 不会，会先备份再合并。

**Q: 支持 Windows 吗？**  
A: 需要 WSL 或 Git Bash。

**Q: 如何添加更多模型？**  
A: 手动编辑配置文件，或查看 [文档](https://docs.crazyrouter.com)。

**Q: API Key 格式是什么？**  
A: 通常以 `sk-` 开头，脚本会自动验证格式。

**Q: macOS 上需要安装 jq 吗？**  
A: 建议安装，用于合并配置。安装方式：`brew install jq`

**Q: macOS 提示权限问题怎么办？**  
A: 如果遇到权限问题，使用 `sudo npm install -g openclaw` 安装 OpenClaw。

---

## 📚 相关链接

- **Crazyrouter**: https://crazyrouter.com
- **API 文档**: https://docs.crazyrouter.com
- **OpenClaw**: https://openclaw.ai
- **获取 API Key**: https://crazyrouter.com/dashboard

---

## 💰 优惠活动

通过 [此链接](https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch) 注册：
- 🎁 **$2 免费额度**
- 🎁 首充输入 `OPENCLAW` 获得 **30% 奖励**

---

## 📄 许可证

MIT License

---

<div align="center">

**让 OpenClaw 访问 300+ AI 模型！** 🚀

Made with ❤️ by [Crazyrouter](https://crazyrouter.com)

</div>
🚀

Made with ❤️ by [Crazyrouter](https://crazyrouter.com)

</div>
