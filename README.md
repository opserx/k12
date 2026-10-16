# 圈圈的课外辅导 Skills

[English](./README.en.md) · [GitHub](https://github.com/opserx/k12) · [MIT License](./LICENSE)

这是为中国大陆初中阶段课外辅导准备的一组 Skills，以插件市场 `k12-skills` 的形式发布。安装需要的插件后，直接在 Agent 中调用其中的 skill 即可。

## 来源与同步

- Skills 的唯一来源是 Notion 数据库 [月树提示词](https://app.notion.com/p/3fb2b3b798a980a0be07d82401f4c36c)。每个 skill 是其中的一页，`Tags`（`flow`、`practice`、`tutoring`）决定它属于哪个插件。
- [opserx/notion-skills-github-sync](https://github.com/opserx/notion-skills-github-sync) 每小时把 Notion 中的 skills 同步到本仓库的 `plugins/<tag>/skills/<skill>/`，并更新三个市场清单：`.claude-plugin/marketplace.json`、`.cursor-plugin/marketplace.json`、`.agents/plugins/marketplace.json`。
- `plugins/` 下的文件由同步生成，不要手工修改；下一次同步会覆盖它们。

## 安装

### Claude Code

```bash
claude plugin marketplace add opserx/k12
claude plugin install flow@k12-skills
claude plugin install practice@k12-skills
claude plugin install tutoring@k12-skills
claude plugin install notion-skills-updater@k12-skills   # 可选：在 Agent 中修改 skill
```

在 `/plugin` → Marketplaces 中为 `k12-skills` 打开 auto-update，之后会自动收到更新；也可以运行 `claude plugin update flow@k12-skills`。

### Codex

```bash
codex plugin marketplace add opserx/k12
codex plugin add flow@k12-skills
codex plugin add practice@k12-skills
codex plugin add tutoring@k12-skills
codex plugin add notion-skills-updater@k12-skills   # 可选
```

### Cursor 与团队工作区

Cursor（Dashboard → Plugins → Team Marketplaces → Import from Repo）和 ChatGPT 工作区（Admin Console → Plugins → Import marketplace）都可以直接导入 `https://github.com/opserx/k12`。

## 插件

| 插件 | Skills | 用途 |
| --- | --- | --- |
| `flow` | `k-12-ask-qq`、`k-12-export-enable` | 解释这套 skills 并推荐下一步；为 skill 添加内部导出能力。 |
| `practice` | `k-12-listening-idea-practice`、`k-12-reading-deepth-english`、`k-12-writing-word-chinese` | 听力中心理解、英语文章精读、中文近义词辨析练习。 |
| `tutoring` | `k-12-writing-rewrite-chinese`、`k-12-writing-short-chinese` | 中文病文修改、命题片段写作。 |
| `notion-skills-updater` | `notion-skill-updater` | 通过 Notion MCP 把对 skill 的修改写回 Notion。 |

Notion 导出时会把名称中的 `k12-` 规范为 `k-12-`。

## 修改 skills

在 Notion 中直接编辑对应页面，或安装 `notion-skills-updater` 后让 Agent 通过 Notion MCP 修改。修改会在下一次同步后出现在本仓库，并以新版本号（`1.0.0-notion.<hash>`）推送给已安装的 Agent。

## 全局参考资料

| 文件 | 内容 |
| --- | --- |
| [`project-conventions.md`](./plugins/flow/skills/k-12-ask-qq/references/project-conventions.md) | Skills 的分类、命名规则，以及 `namespace`、`aspect`、`subject`、`category` 数据字典。 |
