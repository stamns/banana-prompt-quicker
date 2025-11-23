# Vercel 部署指南

## 自动部署（推荐）

1. 将项目推送到 GitHub 仓库
2. 在 Vercel 控制台中导入项目：
   - 访问 [vercel.com](https://vercel.com)
   - 点击 "New Project"
   - 导入 GitHub 仓库 `glidea/banana-prompt-quicker`
   - Vercel 会自动检测到 `vercel.json` 配置文件
   - 点击 "Deploy"

## 手动部署

### 前置条件
- 安装 Node.js 和 npm
- 安装 Vercel CLI: `npm install -g vercel`
- 登录 Vercel: `vercel login`

### 部署步骤
```bash
# 克隆项目
git clone https://github.com/glidea/banana-prompt-quicker.git
cd banana-prompt-quicker

# 部署到生产环境
vercel --prod
```

## 配置说明

### vercel.json 配置
- **静态网站部署**: 使用 `@vercel/static` 构建器
- **路由规则**: 
  - `/` -> `index.html`
  - `/privacy` -> `privacy.html`
- **缓存策略**:
  - prompts.json: 5分钟缓存，确保数据及时更新
  - 静态资源: 1年缓存，提升加载速度
- **安全头**: 添加了安全相关的 HTTP 头

### 环境变量（可选）
如需自定义 prompts.json 源，可以设置环境变量：
- `PROMPTS_JSON_URL`: 自定义 prompts.json 的 URL

## 部署验证

部署完成后，验证以下功能：
1. ✅ 网站首页正常加载
2. ✅ 隐私政策页面可访问
3. ✅ prompts.json 数据正确获取
4. ✅ 搜索功能正常工作
5. ✅ 过滤和分类功能正常
6. ✅ 复制提示词功能正常
7. ✅ 图片资源正确显示

## 与原网站对比

Vercel 部署版本应与原网站 [https://glidea.github.io/banana-prompt-quicker](https://glidea.github.io/banana-prompt-quicker) 保持功能一致。

## 自定义域名（可选）

在 Vercel 控制台中可以配置自定义域名：
1. 进入项目设置
2. 点击 "Domains"
3. 添加自定义域名
4. 配置 DNS 记录

## 故障排除

### 常见问题
1. **prompts.json 加载失败**: 检查 GitHub 仓库是否公开，URL 是否正确
2. **图片无法加载**: 检查图片 URL 是否为 HTTPS
3. **路由问题**: 确认 vercel.json 中的路由配置正确

### 日志查看
在 Vercel 控制台的 Functions 标签页可以查看部署日志和错误信息。