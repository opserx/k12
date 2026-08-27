# 圈圈的课外辅导 Skills

[English](./README.en.md) · [项目组织规范](./skills/flow/ask-qq/references/project-organization.md) · [贡献指南](./CONTRIBUTING.md) · [MIT License](./LICENSE)

这是为我刚上初中的儿子 **圈圈** 做的一套课外辅导 Agent Skills。它们把辅导中反复出现的做法写成小而独立、可以组合的指令：先弄清孩子的问题，再选择合适的学习活动，最后根据实际反馈调整。

每个 skill 都是普通文件，不绑定 Claude Code、ChatGPT、Codex 或任何特定模型。只要一个 Agent 支持读取以 `SKILL.md` 为入口、带 YAML frontmatter 的技能目录，就可以使用它。

## 安装

### 从 Git 仓库安装

当仓库发布到 GitHub 后，可使用兼容 [skills.sh](https://skills.sh) 的安装器，把所需的 skill 复制到你的项目中：

```bash
npx skills@latest add <GitHub-用户名>/<仓库名>
```

安装器会让你选择 skill 以及目标 Agent。它复制的是可编辑文件；更新时由你主动执行：

```bash
npx skills@latest update
```

### 任意 Agent 的手动安装

复制一个或多个 `skills/<主题>/<skill-name>/` 目录到你的 Agent 配置的 skills 目录，并确保 Agent 会发现 `SKILL.md`。不需要插件、账号、遥测或运行时依赖。

## 当前技能索引

这是当前可用 skills 的名称和简要说明，由各 skill 的索引元数据自动生成。

<!-- current-skill-index:start -->
| 分类 | Skill | 用途 | 调用方式 |
| --- | --- | --- | --- |
| `flow` | [`ask-qq`](./skills/flow/ask-qq/SKILL.md) | 解释这套 skills，并根据当前困惑推荐下一步。 | 用户主动调用 |
| `practice` | [`listening-main-idea-practice`](./skills/practice/listening-main-idea-practice/SKILL.md) | 每天 10–15 分钟的听力中心理解自我练习。 | 可由用户或 Agent 调用 |
<!-- current-skill-index:end -->

## 项目组织

全局设计和规范文档统一随 [`ask-qq`](./skills/flow/ask-qq/SKILL.md) 分发，位于其 [`references/`](./skills/flow/ask-qq/references/project-organization.md) 中。当前只有目录说明；其他设计和规范将在达成具体约定后逐步补充。`ask-qq` 会读取这些文档，作为解释集合和推荐流程的依据。

## 全局参考资料

| 文件 | 内容 |
| --- | --- |
| [`project-organization.md`](./skills/flow/ask-qq/references/project-organization.md) | 三类 skill 目录的职责、技能命名规范，以及全局参考资料的存放规范。 |

## 参考

本项目借鉴了 [mattpocock/skills](https://github.com/mattpocock/skills) 的思想：用可组合的技能目录、`SKILL.md` 入口和 `skills` 安装器分发；这里不包含其插件清单或任何 Claude Code/ChatGPT 专属约束。
