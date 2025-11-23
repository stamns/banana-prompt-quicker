#!/bin/bash

# 部署验证脚本
# 用于验证 Vercel 部署后的网站功能

echo "🍌 Banana Prompt Quicker - 部署验证脚本"
echo "========================================"

# 检查是否提供了部署 URL
if [ $# -eq 0 ]; then
    echo "❌ 请提供部署后的 URL"
    echo "用法: ./verify-deployment.sh <vercel-url>"
    echo "示例: ./verify-deployment.sh https://banana-prompt-quicker.vercel.app"
    exit 1
fi

DEPLOY_URL=$1
echo "📍 验证 URL: $DEPLOY_URL"

# 检查网站首页
echo ""
echo "1. 检查网站首页..."
if curl -s -f "$DEPLOY_URL" > /dev/null; then
    echo "✅ 网站首页可访问"
else
    echo "❌ 网站首页无法访问"
    exit 1
fi

# 检查隐私政策页面
echo ""
echo "2. 检查隐私政策页面..."
if curl -s -f "$DEPLOY_URL/privacy" > /dev/null || curl -s -f "$DEPLOY_URL/privacy.html" > /dev/null; then
    echo "✅ 隐私政策页面可访问"
else
    echo "❌ 隐私政策页面无法访问"
fi

# 检查 prompts.json
echo ""
echo "3. 检查 prompts.json..."
if curl -s -f "$DEPLOY_URL/prompts.json" > /dev/null; then
    echo "✅ prompts.json 可访问"
    
    # 检查 JSON 格式
    if curl -s "$DEPLOY_URL/prompts.json" | python3 -m json.tool > /dev/null 2>&1; then
        echo "✅ prompts.json 格式正确"
        
        # 检查提示词数量
        PROMPT_COUNT=$(curl -s "$DEPLOY_URL/prompts.json" | python3 -c "import json, sys; data = json.load(sys.stdin); print(len(data))")
        echo "📊 提示词数量: $PROMPT_COUNT"
    else
        echo "❌ prompts.json 格式错误"
    fi
else
    echo "❌ prompts.json 无法访问"
fi

# 检查图片资源
echo ""
echo "4. 检查图片资源..."
if curl -s -f "$DEPLOY_URL/images/modal.png" > /dev/null; then
    echo "✅ 图片资源可访问"
else
    echo "❌ 图片资源无法访问"
fi

# 检查 HTTP 头
echo ""
echo "5. 检查安全头..."
SECURITY_HEADERS=$(curl -s -I "$DEPLOY_URL" | grep -E "(X-Content-Type-Options|X-Frame-Options|X-XSS-Protection)")
if [ -n "$SECURITY_HEADERS" ]; then
    echo "✅ 安全头已设置"
    echo "$SECURITY_HEADERS"
else
    echo "⚠️  部分安全头可能未设置"
fi

# 检查缓存头
echo ""
echo "6. 检查缓存策略..."
PROMPTS_CACHE=$(curl -s -I "$DEPLOY_URL/prompts.json" | grep -i "cache-control")
if [ -n "$PROMPTS_CACHE" ]; then
    echo "✅ prompts.json 缓存策略已设置"
    echo "$PROMPTS_CACHE"
else
    echo "⚠️  prompts.json 缓存策略可能未设置"
fi

echo ""
echo "========================================"
echo "🎉 部署验证完成！"
echo ""
echo "🔗 手动测试建议："
echo "   - 访问 $DEPLOY_URL 测试搜索功能"
echo "   - 测试分类过滤功能"
echo "   - 测试复制提示词功能"
echo "   - 测试响应式布局"