<div align="center">

# OpenClaw Switch to Crazyrouter

### 一键将 OpenClaw 切换到 Crazyrouter，访问 300+ AI 模型

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20macOS-lightgrey.svg)](https://github.com/xujfcn/openclaw-switch)

[English](README.md) | 中文

</div>

## ❤️ 赞助商

<details open>
<summary>点击折叠</summary>

<table>
<tr>
<td width="180"><a href="https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch"><img src="https://crazyrouter.com/logo.png" alt="Crazyrouter" width="150"></a></td>
<td><strong>Crazyrouter</strong> 是一个高性能 AI API 聚合平台——一个 API Key 即可访问 300+ 模型，包括 GPT-4o、Claude 3.5、Gemini 2.0、DeepSeek 等。全部模型低至官方定价的 55%，支持自动故障转移、智能路由和无限并发。通过<a href="https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch">此链接</a>注册即可获得 <strong>$2 免费额度</strong>，首次充值时输入优惠码 <code>OPENCLAW</code> 还可获得额外 <strong>30% 奖励额度</strong>！</td>
</tr>
</table>

</details>

---

## 📖 简介

这个项目提供了一键脚本，让已安装 [OpenClaw](https://openclaw.ai) 的用户可以快速切换到 [Crazyrouter](https://crazyrouter.com)，享受统一的 AI 模型访问体验。

**Crazyrouter** 是一个 AI 模型 API 聚合网关，提供对 300+ AI 模型的统一访问接口：

### 🤖 聊天模型
- **OpenAI**: GPT-4o, GPT-4o-mini, o1, o1-mini
- **Anthropic**: Claude 3.5 Sonnet, Claude 3.5 Haiku, Claude 3 Opus
- **Google**: Gemini 2.0 Flash, Gemini 1.5 Pro
- **DeepSeek**: DeepSeek Chat, DeepSeek Reasoner
- **国内模型**: 通义千问, 文心一言, 豆包, 智谱 GLM

### 🎨 图像生成
- DALL-E 3, Midjourney, Flux, Ideogram, Stable Diffusion

### 🎬 视频生成
- Sora-2, Kling, Luma, Runway, Veo, MiniMax

### 🎵 音频处理
- Whisper (语音识别), TTS (文本转语音), Suno (音乐生成)

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

| 模型 | 说明 | 用途 |
|------|------|------|
| `gpt-4o` | OpenAI 最强多模态模型 | 复杂推理、代码生成 |
| `gpt-4o-mini` | 快速响应版本 | 日常对话、快速任务 |
| `claude-3-5-sonnet-20241022` | Anthropic 旗舰模型 | 长文本处理、代码审查 |
| `claude-3-5-haiku-20241022` | 快速 Claude 模型 | 快速响应、轻量任务 |
| `gemini-2.0-flash-exp` | Google 最新实验版 | 多模态理解 |
| `deepseek-chat` | DeepSeek 对话模型 | 中文对话、编程 |
| `deepseek-reasoner` | DeepSeek 推理模型 | 复杂推理、数学问题 |

**查看完整模型列表：** https://docs.crazyrouter.com

---

## 📂 项目文件

```
openclaw-switch/
├── openclaw-setup.sh          # 简化版一键安装脚本（推荐）
├── switch-to-crazyrouter.sh   # 完整版脚本（详细日志）
├── README.md                  # 项目文档（中文）
├── README_EN.md               # 项目文档（英文）
├── DETAILED_GUIDE.md          # 详细使用指南
└── LICENSE                    # MIT 许可证
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

<details>
<summary><strong>脚本安全吗？</strong></summary>

脚本完全开源，可以先查看源码再运行。只修改 OpenClaw 配置文件，不涉及系统级操作。

</details>

<details>
<summary><strong>会覆盖我现有的配置吗？</strong></summary>

不会。脚本会先备份现有配置，然后合并新配置。其他设置不受影响。

</details>

<details>
<summary><strong>支持 Windows 吗？</strong></summary>

需要 WSL (Windows Subsystem for Linux) 或 Git Bash 环境。

</details>

<details>
<summary><strong>如何验证配置成功？</strong></summary>

脚本运行后会自动测试 API 连接，显示 ✓ 表示成功。

</details>

<details>
<summary><strong>可以添加更多模型吗？</strong></summary>

可以！手动编辑配置文件添加，或查看 [Crazyrouter 文档](https://docs.crazyrouter.com) 获取完整模型列表。

</details>

<details>
<summary><strong>如何切换回官方配置？</strong></summary>

使用备份文件恢复原配置，或者重新运行 OpenClaw 的初始化流程。

</details>

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

在提交 PR 之前，请确保：
- 代码格式正确
- 通过基本测试
- 添加必要的文档说明

---

## 📄 许可证

MIT License - 详见 [LICENSE](LICENSE) 文件

---

## 📞 支持

如有问题，请联系：
- **Telegram**: @crazyrouter
- **Email**: support@crazyrouter.com
- **GitHub Issues**: https://github.com/xujfcn/openclaw-switch/issues

---

<div align="center">

**享受 300+ AI 模型的统一访问体验！** 🚀

Made with ❤️ by [Crazyrouter](https://crazyrouter.com)

</div>
