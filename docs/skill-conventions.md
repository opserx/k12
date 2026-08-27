# Skill 编写规范

## 目录布局

每个 skill 放在 `skills/<category>/<skill-name>/`，并且必须有 `SKILL.md`：

```text
skills/
└── <category>/
    └── <skill-name>/
        └── SKILL.md
```

`category` 当前只能是 `flow`、`tutoring` 或 `practice`。目录分类表达维护和发现语义，不是 Agent 运行时的强制协议。

## 最小格式

```markdown
---
name: skill-name
description: 用一句话说明 skill 做什么，以及何时使用。
---

# Skill title

给 Agent 的、与任务直接相关的说明。
```

- `name` 必须与 `<skill-name>` 目录名完全相同，使用小写 kebab-case。
- `description` 必须简短且可区分，包含能力与适用情形。
- 正文只写会改变 Agent 决策的任务说明；不要重复通用模型能力或捆绑某个产品。
- 需要时才增加 `references/`、`scripts/` 或 `assets/`；并从 `SKILL.md` 说明何时读取或使用它们。

## 调用方式

默认允许 Agent 根据 `description` 自动发现 skill。只有必须由人显式发起的路由或高层流程，才在 frontmatter 添加：

```yaml
disable-model-invocation: true
```

`ask-qq` 使用这一设置，因为它是由用户主动发起的集合入口。

## 修改规则

新增或修改 skill 时，保持 README 中的技能清单、分类和链接同步；涉及集合级设计或规范时，更新本 `docs/` 目录中的对应文档。提交前检查 frontmatter、相对链接和 Git diff。

