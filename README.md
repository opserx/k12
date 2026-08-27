# 圈圈的课外辅导 Skills

[English](./README.en.md) · [GitHub](https://github.com/opserx/k12) · [MIT License](./LICENSE)

这是为初中阶段课外辅导准备的一组 Skills。选择下方需要的 skill 安装后，直接在 Agent 中调用即可。

## 安装

本仓库保持“一个 skill 一个目录”的组织方式。使用 [skills.sh](https://skills.sh) 安装后，skill 会成为你本地可查看、可修改的普通文件；它不会在后台自动改动。

### 按需安装

```bash
npx skills@latest add opserx/k12
```

按提示选择需要的 skill 和目标 Agent。

### 一次安装全部

```bash
npx skills@latest add opserx/k12 --skill '*'
```

这会选择本仓库当前全部 skills；按提示选择要安装到的 Agent。

### 升级

```bash
npx skills@latest update
```

这会把通过 `skills.sh` 安装的 skills 更新到各自来源的最新版本；若你同时安装了其他来源的 skills，它们也会一起检查和更新。和 [Matt Pocock 的 skills](https://github.com/mattpocock/skills) 一样，更新由你主动执行，而不会在后台发生。

也可以把所需的 skill 目录复制到 Agent 的 skills 目录中；这种手动安装没有可追踪的来源，之后需要自行比较和更新。

## 当前技能索引

从这里选择适合当前学习需要的 skill。

<!-- current-skill-index:start -->
| 分类 | Skill | 用途 | 调用方式 |
| --- | --- | --- | --- |
| `flow` | [`k12-ask-qq`](./skills/flow/k12-ask-qq/SKILL.md) | 解释这套 skills，并根据当前困惑推荐下一步。 | 用户主动调用 |
| `practice` | [`k12-listening-main-idea-practice`](./skills/practice/k12-listening-main-idea-practice/SKILL.md) | 每天 10–15 分钟的听力中心理解自我练习，可选择五项子练习。 | 可由用户或 Agent 调用 |
| `practice` | [`k12-writing-synonym-matching-chinese`](./skills/practice/k12-writing-synonym-matching-chinese/SKILL.md) | 中文近义词和近义成语的三对三填空辨析练习。 | 可由用户或 Agent 调用 |
| `tutoring` | [`k12-writing-language-revision-chinese`](./skills/tutoring/k12-writing-language-revision-chinese/SKILL.md) | 中文病文修改：辨析信息、节奏和修饰问题，再比较最佳例文。 | 可由用户或 Agent 调用 |
| `tutoring` | [`k12-writing-prompted-practice-chinese`](./skills/tutoring/k12-writing-prompted-practice-chinese/SKILL.md) | 中文命题片段写作：从出题、初稿到修改稿和最佳例文。 | 可由用户或 Agent 调用 |
<!-- current-skill-index:end -->

## 全局参考资料

| 文件 | 内容 |
| --- | --- |
| [`project-conventions.md`](./skills/flow/k12-ask-qq/references/project-conventions.md) | Skills 的分类、命名规则，以及 `namespace`、`aspect`、`subject`、`category` 数据字典。 |
