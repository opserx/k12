# 圈圈的课外辅导 Skills

[English](./README.en.md) · [GitHub](https://github.com/opserx/k12) · [MIT License](./LICENSE)

这是为初中阶段课外辅导准备的一组 Skills。选择下方需要的 skill 安装后，直接在 Agent 中调用即可。

## 安装

使用 [skills.sh](https://skills.sh) 安装：

```bash
npx skills@latest add opserx/k12
```

按提示选择要安装的 skill 和目标 Agent。之后可用以下命令更新已安装的 skills：

```bash
npx skills@latest update
```

也可以把所需的 skill 目录复制到 Agent 的 skills 目录中。

## 当前技能索引

从这里选择适合当前学习需要的 skill。

<!-- current-skill-index:start -->
| 分类 | Skill | 用途 | 调用方式 |
| --- | --- | --- | --- |
| `flow` | [`k12-ask-qq`](./skills/flow/k12-ask-qq/SKILL.md) | 解释这套 skills，并根据当前困惑推荐下一步。 | 用户主动调用 |
| `flow` | [`k12-export`](./skills/flow/k12-export/SKILL.md) | 将本次学习材料整理为可打印、可直接使用的材料稿。 | 可由用户或 Agent 调用 |
| `practice` | [`k12-listening-main-idea-practice`](./skills/practice/k12-listening-main-idea-practice/SKILL.md) | 每天 10–15 分钟的听力中心理解自我练习。 | 可由用户或 Agent 调用 |
| `practice` | [`k12-writing-synonym-matching-chinese`](./skills/practice/k12-writing-synonym-matching-chinese/SKILL.md) | 中文近义词和近义成语的三对三填空辨析练习。 | 可由用户或 Agent 调用 |
| `tutoring` | [`k12-writing-language-revision-chinese`](./skills/tutoring/k12-writing-language-revision-chinese/SKILL.md) | 中文病文修改：辨析信息、节奏和修饰问题，再比较最佳例文。 | 可由用户或 Agent 调用 |
| `tutoring` | [`k12-writing-prompted-practice-chinese`](./skills/tutoring/k12-writing-prompted-practice-chinese/SKILL.md) | 中文命题片段写作：从出题、初稿到修改稿和最佳例文。 | 可由用户或 Agent 调用 |
<!-- current-skill-index:end -->

## 全局参考资料

| 文件 | 内容 |
| --- | --- |
| [`project-conventions.md`](./skills/flow/k12-ask-qq/references/project-conventions.md) | Skills 的分类、命名规则，以及 `namespace`、`aspect`、`subject`、`category` 数据字典。 |
