# QQ Skills Repository

## Source of truth

- Skills live in the Notion database [月树提示词](https://app.notion.com/p/3fb2b3b798a980a0be07d82401f4c36c) (data source `3fb2b3b7-98a9-808b-8454-000b09aa0f23`). This repository is a generated plugin marketplace named `k12-skills`.
- [opserx/notion-skills-github-sync](https://github.com/opserx/notion-skills-github-sync) runs hourly and writes `plugins/<tag>/skills/<skill>/`, each plugin's `plugin.json`, `.claude-plugin/plugin.json`, `.notion-sync.json`, and the plugin lists in `.claude-plugin/marketplace.json`, `.cursor-plugin/marketplace.json`, `.agents/plugins/marketplace.json`.
- Never edit files under `plugins/` by hand; the next sync overwrites them. To change a skill, edit its Notion page — use the `notion-skill-updater` skill (plugin `notion-skills-updater`) or Notion MCP directly.
- The marketplace identity keys (`name: k12-skills`, owner, description, `interface.displayName`) are kept by the sync and may be edited here.

## Document roles and authority

- `AGENTS.md` is for AI agents working in this repository.
- [`plugins/flow/skills/k-12-ask-qq/references/`](plugins/flow/skills/k-12-ask-qq/references/) contains the authoritative project design and convention documents. When a project-design or convention question arises, read the relevant reference and follow it (and change it in Notion, not here).
- `README.md` and `README.en.md` are user-facing documents. They explain the collection, installation, and the plugins; they are not the source of project-design rules.

## Read first

- The global project conventions are in [project-conventions.md](plugins/flow/skills/k-12-ask-qq/references/project-conventions.md).
- Follow its `k12-aspect-purpose[-subject]` naming convention for ordinary skills. `k12-ask-qq` is the explicit global-router exception. The Notion export normalizes `k12-` to `k-12-` in synced names.

## Internal skill-development capabilities

- `k-12-export-enable` (plugin `flow`) is an internal skill-development capability, not a user-facing learning skill. Use it only when adding or changing an existing skill's internal export instructions and template.
- `k-12-ask-qq` knows that `k-12-export-enable` exists. It may route an internal skill-development request to it, but must not list or recommend it as a skill for users to invoke.

## Plugins and categories

`Tags` in Notion map to plugins: `flow`, `practice`, `tutoring`. When adding, removing, renaming, or moving a skill, update the plugin table in both `README.md` and `README.en.md` by hand.

## Git 发布

- Skills 的发布由同步自动完成：在 Notion 中修改后，最迟一小时内出现在 `main`；需要立即同步时运行 `gh workflow run sync.yml -R opserx/notion-skills-github-sync`。
- 当用户说“发布技能”时，触发上述同步并确认运行成功，而不是在本仓库提交 skill 文件。
- 对本仓库文档的修改直接在 `main` 进行，不主动创建或切换功能分支；只有用户明确要求时才使用其他分支。
