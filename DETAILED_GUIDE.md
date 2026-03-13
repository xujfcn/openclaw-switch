# Crazyrouter OpenClaw 一键切换脚本

## 📦 脚本说明

这个脚本可以让已安装 OpenClaw 的用户一键切换到 Crazyrouter，自动配置 API 和模型。

## 🚀 使用方法

### 1. 下载脚本

```bash
curl -O https://raw.githubusercontent.com/xujfcn/crazyrouter-docs/main/scripts/switch-to-crazyrouter.sh
chmod +x switch-to-crazyrouter.sh
```

### 2. 运行脚本

```bash
./switch-to-crazyrouter.sh YOUR_API_KEY
```

**示例：**
```bash
./switch-to-crazyrouter.sh sk-xxxxxxxxxxxxx
```

## ✨ 功能特性

- ✅ 自动检测 OpenClaw 安装状态
- ✅ 备份现有配置（防止数据丢失）
- ✅ 配置 Crazyrouter API 端点
- ✅ 预配置常用模型（GPT-4o, Claude, Gemini, DeepSeek）
- ✅ 自动重启 Gateway
- ✅ 验证 API 连接
- ✅ 彩色输出，清晰易读

## 📋 预配置模型

脚本会自动配置以下模型：

| 模型 ID | 说明 |
|---------|------|
| `gpt-4o` | OpenAI GPT-4o |
| `gpt-4o-mini` | OpenAI GPT-4o Mini |
| `claude-3-5-sonnet-20241022` | Anthropic Claude 3.5 Sonnet |
| `claude-3-5-haiku-20241022` | Anthropic Claude 3.5 Haiku |
| `gemini-2.0-flash-exp` | Google Gemini 2.0 Flash |
| `deepseek-chat` | DeepSeek Chat |
| `deepseek-reasoner` | DeepSeek Reasoner |

## 🔧 脚本工作流程

1. **检查环境**
   - 验证 OpenClaw 是否已安装
   - 检查 Gateway 运行状态

2. **备份配置**
   - 自动备份现有配置到 `~/.openclaw/config.json.backup.YYYYMMDD_HHMMSS`

3. **应用配置**
   - 如果 Gateway 运行中：通过 API 动态更新
   - 如果 Gateway 未运行：直接修改配置文件

4. **验证连接**
   - 测试 Crazyrouter API 连接
   - 确认配置成功

5. **完成**
   - 显示可用模型列表
   - 提供配置备份位置

## 📝 配置示例

脚本会将以下配置应用到 OpenClaw：

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
      // ... 更多模型
    ]
  }
}
```

## 🛠️ 手动配置（可选）

如果你想手动配置，可以编辑 `~/.openclaw/config.json`：

```bash
nano ~/.openclaw/config.json
```

然后重启 Gateway：

```bash
openclaw gateway restart
```

## ❓ 常见问题

### Q: 脚本需要 root 权限吗？
A: 不需要，使用普通用户权限即可。

### Q: 会覆盖我现有的配置吗？
A: 脚本会先备份现有配置，然后合并新配置。原有的其他配置不会丢失。

### Q: 如何恢复原来的配置？
A: 使用备份文件恢复：
```bash
cp ~/.openclaw/config.json.backup.YYYYMMDD_HHMMSS ~/.openclaw/config.json
openclaw gateway restart
```

### Q: 支持哪些操作系统？
A: Linux 和 macOS。Windows 用户请使用 WSL 或 Git Bash。

### Q: 需要安装额外的依赖吗？
A: 只需要 `curl` 和 `jq`（大多数系统已预装）。

## 🔗 相关链接

- **Crazyrouter 官网**: https://crazyrouter.com
- **API 文档**: https://docs.crazyrouter.com
- **获取 API Key**: https://crazyrouter.com/dashboard
- **OpenClaw 文档**: https://docs.openclaw.ai

## 📞 支持

如有问题，请联系：
- Telegram: @crazyrouter
- Email: support@crazyrouter.com

---

**享受 300+ AI 模型的统一访问体验！** 🚀
