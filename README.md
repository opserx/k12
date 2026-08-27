# 圈圈的课外辅导 Skills

[English](./README.en.md) · [贡献指南](./CONTRIBUTING.md) · [MIT License](./LICENSE)

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

## 当前 Skills

| 分类 | Skill | 用途 | 调用方式 |
| --- | --- | --- | --- |
| `flow` | [`ask-qq`](./skills/flow/ask-qq/SKILL.md) | 解释这套 skills，并根据当前困惑推荐下一步。 | 用户主动调用 |
| `tutoring` | [`lesson-planner`](./skills/tutoring/lesson-planner/SKILL.md) | 空白起步 skill：以后用于设计一次辅导课。 | 可由用户或 Agent 调用 |
| `practice` | [`practice-review`](./skills/practice/practice-review/SKILL.md) | 空白起步 skill：以后用于复盘自我练习与错题。 | 可由用户或 Agent 调用 |

## 目录约定

```text
skills/
├── flow/                         # 流程与技能路由
│   └── ask-qq/
│       └── SKILL.md
├── tutoring/                     # 辅导
│   └── lesson-planner/
│       └── SKILL.md
└── practice/                     # 自我练习
    └── practice-review/
        └── SKILL.md
```

一个 skill 的最低可移植格式是：

```markdown
---
name: skill-name
description: 用一句话说明它做什么，以及何时使用。
---

# Skill title

给 Agent 的、与任务直接相关的说明。
```

`name` 与目录名保持一致；`description` 用于发现与路由；正文仅保留能改变 Agent 决策的内容。复杂 skill 可以按需增加 `references/`、`scripts/` 和 `assets/`，但不把某个产品的专属配置作为通用格式的一部分。

## 原则

- **以孩子为中心**：先理解题目、目标和当前感受，不替孩子追求虚假的“高效”。
- **小而可组合**：一个 skill 专注一件事，可以和其他 skills 一起使用。
- **工具中立**：技能文件不假定特定模型、CLI、插件或云服务存在。
- **可修改、可追踪**：所有内容都留在 Git 中，由使用者自己决定何时更新。

## 参考

本项目借鉴了 [mattpocock/skills](https://github.com/mattpocock/skills) 的思想：用可组合的技能目录、`SKILL.md` 入口和 `skills` 安装器分发；这里不包含其插件清单或任何 Claude Code/ChatGPT 专属约束。
