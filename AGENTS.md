# QQ Skills Repository

## Document roles and authority

- `AGENTS.md` is for AI agents working in this repository. It defines the repository-maintenance instructions in this file.
- [`skills/flow/k12-ask-qq/references/`](skills/flow/k12-ask-qq/references/) contains the authoritative project design and convention documents. When a project-design or convention question arises, read the relevant reference and follow it.
- `README.md` and `README.en.md` are user-facing documents. They explain the collection, installation, and the currently available skills; they are not the source of project-design rules.

## Read first

- The global project conventions are in [project-conventions.md](skills/flow/k12-ask-qq/references/project-conventions.md).
- Follow its `k12-aspect-purpose[-subject]` naming convention for ordinary skills. `k12-ask-qq` is the explicit global-router exception.

## Internal skill-development capabilities

- [`k12-export-enable`](skills/flow/k12-export-enable/SKILL.md) is an internal skill-development capability, not a user-facing learning skill. Use it only when adding or changing an existing skill's internal export instructions and template.
- Mark internal skills with `metadata.index.visibility: internal`. They must remain out of the README skill indexes, even though agents working in this repository may use them.
- [`k12-ask-qq`](skills/flow/k12-ask-qq/SKILL.md) knows that `k12-export-enable` exists. It may route an internal skill-development request to it, but must not list or recommend it as a skill for users to invoke.

## Current skill index

The `## 当前技能索引` table in `README.md` and the `## Current skill index` table in `README.en.md` are generated human-facing indexes of currently available skills.

When adding, removing, renaming, moving, or materially changing a skill:

1. Set `metadata.index.summary_zh` and `metadata.index.summary_en` in the skill's `SKILL.md` frontmatter. Set `metadata.index.visibility: internal` for an internal skill-development capability.
2. Run `ruby scripts/update-skill-index.rb` to regenerate both README tables.
3. Run `ruby scripts/update-skill-index.rb --check` before committing.

The script derives the name, category, relative link, and invocation mode from each public skill. Never edit content between the `current-skill-index` markers by hand. Keep both summaries concise and useful for someone choosing a skill; the index will then grow automatically with the collection.

## Git 发布

- 当用户说“发布技能”时，先检查工作区和远端 `main` 状态，然后将工作区中的全部改动（包括新增、删除和重命名）提交到本地 `main`，并推送到 `origin/main`。
- 日常开发直接在 `main` 进行，不主动创建或切换功能分支；只有用户明确要求时才使用其他分支。
