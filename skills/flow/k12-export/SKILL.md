---
name: k12-export
description: 将当前会话中的学习材料按来源 skill 的导出模板整理为 chat 回复或 PDF。仅在用户明确要求导出、生成打印稿或整理本次学习材料时使用。
metadata:
  index:
    summary_zh: 按来源 skill 的模板，将本次学习材料导出为 chat 回复或 PDF。
    summary_en: Exports the current learning materials to chat or PDF using each source skill's template.
---

# K12 Export

## 使用

仅在用户明确要求导出、生成打印稿或整理本次学习材料时使用。

开始导出时，必须按以下顺序执行：

1. 判断当前会话实际使用的 skill 名称；不要根据材料主题猜测。
2. 找到每个已使用 skill 的固定模板文件 `references/export-template.md` 并读取它。
3. 只按这些模板收集当前会话已出现的材料，再按用户选择的方式导出。

没有模板的 skill 不属于本次可按专属结构导出的来源；说明这一点，不要自行补造章节。

- **chat**：默认方式。直接在当前会话的一条新回复中输出完整、可独立阅读的导出内容；不创建文件。用户可使用该回复下方的导出功能取得实际文本。
- **pdf**：仅当用户明确要求 PDF 时使用。按同一份导出内容生成实际 PDF 文件并提供它；不要以一段不完整的 chat 内容代替 PDF。

导出只整理当前会话实际出现的学习材料，不开启新练习、不编造缺失材料，也不改写学生原文。无法取得的附件、图片或非文本材料要明确列出。

## 接口

导出前必须阅读 [导出接口](references/export-interface.md)。它规定了来源 skill 如何声明可导出内容，以及如何读取其模板。
