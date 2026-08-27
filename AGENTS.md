# QQ Skills Repository

## Document roles and authority

- `AGENTS.md` is for AI agents working in this repository. It defines the repository-maintenance instructions in this file.
- [`skills/flow/ask-qq/references/`](skills/flow/ask-qq/references/) contains the authoritative project design and convention documents. When a project-design or convention question arises, read the relevant reference and follow it.
- `README.md` and `README.en.md` are user-facing documents. They explain the collection, installation, and the currently available skills; they are not the source of project-design rules.

## Read first

- The global project conventions are in [project-conventions.md](skills/flow/ask-qq/references/project-conventions.md).
- Follow its `aspect-purpose[-subject]` naming convention for ordinary skills. `ask-qq` is the explicit global-router exception.

## Current skill index

The `## 当前技能索引` table in `README.md` and the `## Current skill index` table in `README.en.md` are generated human-facing indexes of currently available skills.

When adding, removing, renaming, moving, or materially changing a skill:

1. Set `metadata.index.summary_zh` and `metadata.index.summary_en` in the skill's `SKILL.md` frontmatter.
2. Run `ruby scripts/update-skill-index.rb` to regenerate both README tables.
3. Run `ruby scripts/update-skill-index.rb --check` before committing.

The script derives the name, category, relative link, and invocation mode from each existing skill. Never edit content between the `current-skill-index` markers by hand. Keep both summaries concise and useful for someone choosing a skill; the index will then grow automatically with the collection.
