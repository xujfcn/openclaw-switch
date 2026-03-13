<div align="center">

# OpenClaw + Crazyrouter

### 一键配置脚本：让 OpenClaw 访问 300+ AI 模型

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

[English](README_EN.md) | 中文

</div>

---

## 🚀 一键安装

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash -s YOUR_API_KEY
```

**替换 `YOUR_API_KEY` 为你的 Crazyrouter API Key**  
**获取 API Key**: https://crazyrouter.com

---

## 📖 这是什么？

这是一个专为 **OpenClaw** 用户设计的配置脚本，帮助你快速切换到 **Crazyrouter** API。

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

## ⚡ 快速开始

### 1. 安装 OpenClaw（如果还没安装）

```bash
npm install -g openclaw
```

### 2. 运行配置脚本

```bash
curl -fsSL https://raw.githubusercontent.com/xujfcn/openclaw-switch/main/openclaw-setup.sh | bash -s YOUR_API_KEY
```

### 3. 完成！

脚本会自动：
- ✅ 备份现有配置
- ✅ 配置 Crazyrouter API
- ✅ 预置常用模型
- ✅ 重启 Gateway
- ✅ 验证连接

---

## 🎯 预配置模型

脚本会自动配置以下模型：

```json
{
  "gpt-4o": "OpenAI 最强模型",
  "gpt-4o-mini": "快速响应版本",
  "claude-3-5-sonnet-20241022": "Anthropic 旗舰",
  "claude-3-5-haiku-20241022": "快速 Claude",
  "gemini-2.0-flash-exp": "Google 最新",
  "deepseek-chat": "DeepSeek 对话",
  "deepseek-reasoner": "DeepSeek 推理"
}
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
cp ~/.openclaw/config.json.backup.20260313_123456 ~/.openclaw/config.json
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
