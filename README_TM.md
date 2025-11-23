# Banana Prompt Quicker (Tampermonkey Edition)

Prompts quicker is ALL you 🍌 need.
这是一个将 Banana Prompt Quicker 扩展移植到 Tampermonkey 的用户脚本，支持在 Google AI Studio 和 Gemini 中快速插入提示词。

## 功能特性

- **多平台支持**: 完美适配 Google AI Studio 和 Gemini。
- **提示词库**: 内置丰富的提示词库，支持搜索、分类过滤。
- **自定义管理**: 支持添加、编辑、删除自定义提示词 (存储在本地)。
- **收藏功能**: 收藏常用的提示词，快速访问。
- **一键插入**: 点击提示词即可自动插入到输入框。

## 安装说明

1. 确保浏览器已安装 **Tampermonkey** 插件 (Chrome, Edge, Firefox, Safari 等)。
2. 获取 `banana-prompt-quicker.user.js` 脚本文件。
3. 在 Tampermonkey 管理面板中，点击 "添加新脚本"。
4. 将 `banana-prompt-quicker.user.js` 的内容复制并粘贴到编辑器中。
5. 点击 "文件" -> "保存"。

或者，如果脚本托管在网络上，直接点击安装链接即可。

## 使用说明

1. 打开 [Google AI Studio](https://aistudio.google.com/) 或 [Google Gemini](https://gemini.google.com/)。
2. 在输入框附近寻找 🍌 (香蕉) 图标。
   - **Gemini**: 图标通常位于输入框左下角的图片上传按钮旁边。
   - **AI Studio**: 图标位于 Run 按钮旁边。
3. 点击香蕉图标打开提示词面板。
4. **浏览**: 上下滚动浏览提示词。
5. **搜索**: 在顶部搜索框输入关键词。
6. **筛选**: 点击分类下拉框或过滤按钮 (收藏/自定义/生图/编辑)。
7. **插入**: 点击提示词卡片内容，自动插入到输入框。
8. **自定义**: 点击 "+" 按钮添加自己的提示词。

## 配置导入 (可选)

脚本会自动从 GitHub 获取最新的提示词库。
如果您需要离线使用或手动导入配置，可以使用 `banana-config.json` 文件。
目前脚本主要依赖在线更新和本地存储 (`GM_setValue`)。

## 常见问题

- **看不到香蕉图标?**
  尝试刷新页面。如果仍然没有，请检查 Tampermonkey 是否已启用该脚本。
- **提示词加载失败?**
  脚本需要访问 GitHub (`raw.githubusercontent.com`) 获取提示词库，请确保网络连接正常。

## 开发者

原作者: Glidea
Tampermonkey 移植: AI Assistant
