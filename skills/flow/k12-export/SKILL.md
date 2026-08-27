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

- **chat**：默认方式。直接在当前会话的一条新回复中输出完整、可独立阅读的导出内容；不创建文件。用户可使用该回复下方的导出功能取得实际文本。
- **pdf**：仅当用户明确要求 PDF 时使用。按同一份导出内容生成实际 PDF 文件并提供它；不要以一段不完整的 chat 内容代替 PDF。

导出只整理当前会话实际出现的学习材料，不开启新练习、不编造缺失材料，也不改写学生原文。无法取得的附件、图片或非文本材料要明确列出。

## 接口

导出前必须阅读 [导出接口](references/export-interface.md)。它规定了来源 skill 如何声明可导出内容，以及如何读取其模板。
