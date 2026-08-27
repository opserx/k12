---
name: k12-export-enable
description: 为已有 K12 skill 添加 `k12-export` 支持：声明导出来源名称，并创建固定的导出模板。用于用户要求某个 skill 的会话材料可被结构化导出时。
metadata:
  index:
    summary_zh: 为已有 skill 添加可由 `k12-export` 使用的来源声明和导出模板。
    summary_en: Adds a source declaration and export template so an existing skill works with `k12-export`.
---

# Enable K12 Export

为一个已有 skill 添加导出支持，不改变它原有的学习或辅导流程。

## 改造步骤

1. 读取目标 `SKILL.md` 的 frontmatter，取得其 `name`；这就是唯一的导出来源名称，不要另起别名。
2. 在目标 skill 创建固定文件 `references/export-template.md`。
3. 在目标 `SKILL.md` 添加 `## 导出` 小节，明确写出：
   - 它支持 `k12-export`；
   - 导出来源名称为该 skill 的 `name`；
   - 仅在用户要求导出时读取 `references/export-template.md`。
4. 不改动原有练习、辅导或流程规则，除非为补足导出所需的材料角色而确有必要。

## 模板要求

模板必须使用以下最小结构：

```md
# <导出材料总标题>

## 来源技能

- **名称**：`<目标 skill 的 name>`

## <章节标题>

- **说明**：这一章的作用。
- **内容**：只放入当前会话实际出现的材料。
```

根据目标 skill 已经会产生的材料，增加必要章节，例如题目、学生作答、反馈、修改稿或例文。不要为尚不存在的流程设计章节；没有实际材料的章节在导出时应省略。

## 完成检查

- `references/export-template.md` 存在且包含总标题、来源技能、章节标题、说明和内容。
- 模板中的来源名称与 `SKILL.md` frontmatter 的 `name` 完全一致。
- `SKILL.md` 的 `## 导出` 小节链接该模板。
