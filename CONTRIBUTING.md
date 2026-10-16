# Contributing

Skills are authored in the Notion database [月树提示词](https://app.notion.com/p/3fb2b3b798a980a0be07d82401f4c36c), not in this repository. Everything under `plugins/` and the three `marketplace.json` files' plugin lists are generated hourly by [opserx/notion-skills-github-sync](https://github.com/opserx/notion-skills-github-sync); hand edits are overwritten.

- Add or edit a skill as a page in the database: `Skill name` and `Description` become the `SKILL.md` frontmatter, the page body becomes its content, and supporting files (references, templates) go in `Files`.
- Set `Tags` to exactly one category (`flow`, `practice`, `tutoring`); it decides the plugin. An untagged skill becomes a plugin of its own.
- Follow the `k12-aspect-purpose[-subject]` naming convention in the [project conventions](./plugins/flow/skills/k-12-ask-qq/references/project-conventions.md).
- Keep the entrypoint short and tool-neutral, understandable without a particular agent product.
- To make a skill exportable, use the internal `k-12-export-enable` capability.
- Agents can edit skills through the `notion-skill-updater` skill (plugin `notion-skills-updater`), which writes back via the Notion MCP.

Only the marketplace identity (`name: k12-skills`, owner, description) and the documentation files are edited in this repository.
