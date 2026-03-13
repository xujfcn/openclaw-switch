#!/bin/bash
# Crazyrouter OpenClaw 一键切换脚本（简化版）
# 使用方法：curl -fsSL https://crazyrouter.com/openclaw-setup.sh | bash -s YOUR_API_KEY

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

print_info() { echo -e "${GREEN}✓${NC} $1"; }
print_warn() { echo -e "${YELLOW}!${NC} $1"; }
print_error() { echo -e "${RED}✗${NC} $1"; }

# 检查参数
if [ -z "$1" ]; then
    print_error "请提供 Crazyrouter API Key"
    echo ""
    echo "使用方法："
    echo "  curl -fsSL https://crazyrouter.com/openclaw-setup.sh | bash -s YOUR_API_KEY"
    echo ""
    echo "或下载后运行："
    echo "  bash openclaw-setup.sh YOUR_API_KEY"
    exit 1
fi

API_KEY="$1"

# 检查 OpenClaw
if ! command -v openclaw &> /dev/null; then
    print_error "OpenClaw 未安装"
    echo ""
    echo "请先安装 OpenClaw："
    echo "  npm install -g openclaw"
    exit 1
fi

print_info "检测到 OpenClaw $(openclaw --version)"

# 备份配置
CONFIG_FILE="$HOME/.openclaw/config.json"
if [ -f "$CONFIG_FILE" ]; then
    BACKUP="$CONFIG_FILE.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$CONFIG_FILE" "$BACKUP"
    print_info "配置已备份到: $BACKUP"
fi

# 创建配置补丁
print_info "正在配置 Crazyrouter..."

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
        exit 1
    fi
else
    print_warn "Gateway 未运行，手动更新配置文件..."
    
    if command -v jq &> /dev/null && [ -f "$CONFIG_FILE" ]; then
        jq -s '.[0] * .[1]' "$CONFIG_FILE" /tmp/crazyrouter.json > /tmp/merged.json
        mv /tmp/merged.json "$CONFIG_FILE"
    else
        cp /tmp/crazyrouter.json "$CONFIG_FILE"
    fi
    
    print_info "启动 Gateway..."
    openclaw gateway start
    sleep 2
fi

rm -f /tmp/crazyrouter.json

# 验证连接
print_info "验证 API 连接..."
if curl -s https://crazyrouter.com/v1/models \
    -H "Authorization: Bearer $API_KEY" | grep -q "data"; then
    print_info "API 连接成功"
else
    print_error "API 连接失败，请检查 API Key"
    exit 1
fi

# 完成
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
print_info "🎉 配置完成！OpenClaw 已切换到 Crazyrouter"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "可用模型: gpt-4o, claude-3-5-sonnet, gemini-2.0-flash, deepseek-chat..."
echo "查看更多: https://docs.crazyrouter.com"
echo ""
