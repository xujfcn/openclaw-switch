#!/bin/bash
# Crazyrouter OpenClaw 配置切换脚本
# 用途：将 OpenClaw 的模型和 baseUrl 切换为 Crazyrouter
# 使用方法：bash switch-to-crazyrouter.sh YOUR_API_KEY

set -e

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# 打印带颜色的消息
print_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 检查是否提供了 API Key
if [ -z "$1" ]; then
    print_error "请提供 Crazyrouter API Key"
    echo "使用方法: bash $0 YOUR_API_KEY"
    echo ""
    echo "示例: bash $0 sk-xxxxxxxxxxxxx"
    echo ""
    echo "获取 API Key: https://crazyrouter.com"
    exit 1
fi

API_KEY="$1"

# 检查 OpenClaw 是否已安装
if ! command -v openclaw &> /dev/null; then
    print_error "OpenClaw 未安装"
    echo "请先安装 OpenClaw: npm install -g openclaw"
    exit 1
fi

print_info "检测到 OpenClaw 版本: $(openclaw --version)"

# 检查 Gateway 是否在运行
GATEWAY_RUNNING=false
if openclaw gateway status &> /dev/null; then
    GATEWAY_RUNNING=true
    print_info "Gateway 正在运行，将在配置后重启"
fi

# 备份现有配置
CONFIG_DIR="$HOME/.openclaw"
CONFIG_FILE="$CONFIG_DIR/config.json"

if [ -f "$CONFIG_FILE" ]; then
    BACKUP_FILE="$CONFIG_FILE.backup.$(date +%Y%m%d_%H%M%S)"
    cp "$CONFIG_FILE" "$BACKUP_FILE"
    print_info "已备份配置到: $BACKUP_FILE"
else
    print_warn "未找到现有配置文件，将创建新配置"
fi

# 创建 Crazyrouter 配置补丁
print_info "正在配置 Crazyrouter..."

# 使用 OpenClaw Gateway API 更新配置
cat > /tmp/crazyrouter_patch.json <<EOF
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
      {
        "id": "gpt-4o",
        "provider": "crazyrouter",
        "name": "gpt-4o"
      },
      {
        "id": "gpt-4o-mini",
        "provider": "crazyrouter",
        "name": "gpt-4o-mini"
      },
      {
        "id": "claude-3-5-sonnet-20241022",
        "provider": "crazyrouter",
        "name": "claude-3-5-sonnet-20241022"
      },
      {
        "id": "claude-3-5-haiku-20241022",
        "provider": "crazyrouter",
        "name": "claude-3-5-haiku-20241022"
      },
      {
        "id": "gemini-2.0-flash-exp",
        "provider": "crazyrouter",
        "name": "gemini-2.0-flash-exp"
      },
      {
        "id": "deepseek-chat",
        "provider": "crazyrouter",
        "name": "deepseek-chat"
      },
      {
        "id": "deepseek-reasoner",
        "provider": "crazyrouter",
        "name": "deepseek-reasoner"
      }
    ]
  }
}
EOF

# 应用配置补丁
if [ "$GATEWAY_RUNNING" = true ]; then
    print_info "通过 Gateway API 应用配置..."
    
    # 使用 curl 调用 Gateway config.patch API
    RESPONSE=$(curl -s -X POST http://localhost:3777/api/gateway/config.patch \
        -H "Content-Type: application/json" \
        -d @/tmp/crazyrouter_patch.json)
    
    if echo "$RESPONSE" | grep -q "success"; then
        print_info "配置已成功应用"
    else
        print_error "配置应用失败"
        echo "$RESPONSE"
        exit 1
    fi
    
    # Gateway 会自动重启
    print_info "Gateway 正在重启..."
    sleep 3
else
    # Gateway 未运行，直接修改配置文件
    print_warn "Gateway 未运行，手动修改配置文件"
    
    if [ -f "$CONFIG_FILE" ]; then
        # 使用 jq 合并配置（如果安装了 jq）
        if command -v jq &> /dev/null; then
            jq -s '.[0] * .[1]' "$CONFIG_FILE" /tmp/crazyrouter_patch.json > /tmp/config_merged.json
            mv /tmp/config_merged.json "$CONFIG_FILE"
            print_info "配置已更新"
        else
            print_error "需要安装 jq 来合并配置"
            echo "请手动将以下内容合并到 $CONFIG_FILE："
            cat /tmp/crazyrouter_patch.json
            exit 1
        fi
    else
        # 创建新配置
        cp /tmp/crazyrouter_patch.json "$CONFIG_FILE"
        print_info "已创建新配置文件"
    fi
    
    # 启动 Gateway
    print_info "启动 Gateway..."
    openclaw gateway start
fi

# 清理临时文件
rm -f /tmp/crazyrouter_patch.json

# 验证配置
print_info "验证配置..."
sleep 2

# 测试 API 连接
TEST_RESPONSE=$(curl -s https://crazyrouter.com/v1/models \
    -H "Authorization: Bearer $API_KEY" | head -c 100)

if echo "$TEST_RESPONSE" | grep -q "data"; then
    print_info "✅ Crazyrouter API 连接成功"
else
    print_error "❌ Crazyrouter API 连接失败，请检查 API Key"
    exit 1
fi

# 完成
echo ""
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
print_info "✅ 配置完成！OpenClaw 已切换到 Crazyrouter"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "可用模型："
echo "  • gpt-4o"
echo "  • gpt-4o-mini"
echo "  • claude-3-5-sonnet-20241022"
echo "  • claude-3-5-haiku-20241022"
echo "  • gemini-2.0-flash-exp"
echo "  • deepseek-chat"
echo "  • deepseek-reasoner"
echo ""
echo "查看更多模型: https://docs.crazyrouter.com"
echo "配置备份: $BACKUP_FILE"
echo ""
print_info "现在可以开始使用 OpenClaw 了！"
