#!/bin/bash
# Crazyrouter OpenClaw 一键配置脚本（交互式版本）
# 使用方法：bash openclaw-setup.sh

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m'

print_info() { echo -e "${GREEN}✓${NC} $1"; }
print_warn() { echo -e "${YELLOW}!${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }
print_header() { echo -e "${CYAN}$1${NC}"; }

# 打印欢迎信息
clear
echo ""
echo -e "${CYAN}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║                                                            ║${NC}"
echo -e "${CYAN}║          OpenClaw + Crazyrouter 一键配置脚本               ║${NC}"
echo -e "${CYAN}║                                                            ║${NC}"
echo -e "${CYAN}║          访问 300+ AI 模型，官方价格 55% 折扣              ║${NC}"
echo -e "${CYAN}║                                                            ║${NC}"
echo -e "${CYAN}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# 检查 OpenClaw
print_header "🔍 检查环境..."
if ! command -v openclaw &> /dev/null; then
    print_error "OpenClaw 未安装"
    echo ""
    echo "请先安装 OpenClaw："
    echo -e "${BLUE}  npm install -g openclaw${NC}"
    echo ""
    exit 1
fi

print_info "检测到 OpenClaw $(openclaw --version)"
echo ""

# 获取 API Key
print_header "🔑 配置 Crazyrouter API Key"
echo ""
echo "如果还没有 API Key，请访问："
echo -e "${BLUE}  https://crazyrouter.com/dashboard${NC}"
echo ""
echo "注册优惠："
echo -e "  🎁 通过此链接注册获得 ${GREEN}\$2 免费额度${NC}"
echo -e "  🎁 首充输入 ${GREEN}OPENCLAW${NC} 获得 ${GREEN}30% 奖励${NC}"
echo -e "${BLUE}  https://crazyrouter.com/register?aff=OZcm&ref=openclaw-switch${NC}"
echo ""

# 交互式输入 API Key
while true; do
    read -p "请输入你的 Crazyrouter API Key: " API_KEY
    
    if [ -z "$API_KEY" ]; then
        print_error "API Key 不能为空"
        echo ""
        continue
    fi
    
    # 验证 API Key 格式
    if [[ ! "$API_KEY" =~ ^sk- ]]; then
        print_warn "API Key 格式可能不正确（通常以 sk- 开头）"
        read -p "是否继续？(y/n): " confirm
        if [[ ! "$confirm" =~ ^[Yy]$ ]]; then
            echo ""
            continue
        fi
    fi
    
    break
done

echo ""
print_info "API Key 已接收"
echo ""

# 备份配置
print_header "💾 备份现有配置..."
CONFIG_FILE="$HOME/.openclaw/config.json"
if [ -f "$CONFIG_FILE" ]; then
    BACKUP="$CONFIG_FILE.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$CONFIG_FILE" "$BACKUP"
    print_info "配置已备份到: $BACKUP"
else
    print_warn "未找到现有配置，将创建新配置"
fi
echo ""

# 创建配置补丁
print_header "⚙️  配置 Crazyrouter..."

cat > /tmp/crazyrouter.json <<EOF
{
  "llm": {
    "providers": [
      {
        "id": "crazyrouter",
        "type": "openai",
        "baseUrl": "https://crazyrouter.com/v1",
        "apiKey": "$API_KEY"
      }
    ],
    "models": [
      {"id": "gpt-4o", "provider": "crazyrouter", "name": "gpt-4o"},
      {"id": "gpt-4o-mini", "provider": "crazyrouter", "name": "gpt-4o-mini"},
      {"id": "claude-3-5-sonnet-20241022", "provider": "crazyrouter", "name": "claude-3-5-sonnet-20241022"},
      {"id": "claude-3-5-haiku-20241022", "provider": "crazyrouter", "name": "claude-3-5-haiku-20241022"},
      {"id": "gemini-2.0-flash-exp", "provider": "crazyrouter", "name": "gemini-2.0-flash-exp"},
      {"id": "deepseek-chat", "provider": "crazyrouter", "name": "deepseek-chat"},
      {"id": "deepseek-reasoner", "provider": "crazyrouter", "name": "deepseek-reasoner"}
    ]
  }
}
EOF

# 应用配置
if openclaw gateway status &> /dev/null; then
    print_info "通过 Gateway API 更新配置..."
    RESPONSE=$(curl -s -X POST http://localhost:3777/api/gateway/config.patch \
        -H "Content-Type: application/json" \
        -d @/tmp/crazyrouter.json)
    
    if echo "$RESPONSE" | grep -q "success\|ok"; then
        print_info "配置已应用，Gateway 正在重启..."
        sleep 3
    else
        print_error "配置失败: $RESPONSE"
        rm -f /tmp/crazyrouter.json
        exit 1
    fi
else
    print_warn "Gateway 未运行，手动更新配置文件..."
    
    if command -v jq &> /dev/null && [ -f "$CONFIG_FILE" ]; then
        jq -s '.[0] * .[1]' "$CONFIG_FILE" /tmp/crazyrouter.json > /tmp/merged.json
        mv /tmp/merged.json "$CONFIG_FILE"
    else
        mkdir -p "$HOME/.openclaw"
        cp /tmp/crazyrouter.json "$CONFIG_FILE"
    fi
    
    print_info "启动 Gateway..."
    openclaw gateway start
    sleep 2
fi

rm -f /tmp/crazyrouter.json
echo ""

# 验证连接
print_header "✅ 验证 API 连接..."
if curl -s https://crazyrouter.com/v1/models \
    -H "Authorization: Bearer $API_KEY" | grep -q "data"; then
    print_info "API 连接成功"
else
    print_error "API 连接失败，请检查 API Key"
    exit 1
fi

# 完成
echo ""
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}                    🎉 配置完成！                          ${NC}"
echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo "✨ 已配置的模型："
echo ""
echo "  🤖 聊天模型："
echo "     • gpt-4o              (OpenAI 最强)"
echo "     • gpt-4o-mini         (快速响应)"
echo "     • claude-3-5-sonnet   (Anthropic 旗舰)"
echo "     • claude-3-5-haiku    (快速 Claude)"
echo "     • gemini-2.0-flash    (Google 最新)"
echo "     • deepseek-chat       (DeepSeek 对话)"
echo "     • deepseek-reasoner   (DeepSeek 推理)"
echo ""
echo "📚 查看更多模型："
echo -e "   ${BLUE}https://docs.crazyrouter.com${NC}"
echo ""
echo "💡 使用提示："
echo "   • 配置已自动备份"
echo "   • 现在可以直接使用 OpenClaw"
echo "   • 所有 API 调用将通过 Crazyrouter"
echo ""
echo -e "${CYAN}感谢使用 Crazyrouter！${NC}"
echo ""
