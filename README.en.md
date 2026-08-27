# QQ's After-School Tutoring Skills

[中文](./README.md) · [Project documentation](./docs/README.md) · [Contributing](./CONTRIBUTING.md) · [MIT License](./LICENSE)

This is a collection of agent skills for after-school tutoring, made for my son **QQ**, who has just started middle school. The collection turns repeatable tutoring habits into small, composable instructions: understand the learner's question first, choose a suitable learning activity, then adapt to real feedback.

Every skill is an ordinary directory. The collection is not tied to Claude Code, ChatGPT, Codex, or a particular model. Any agent that discovers `SKILL.md` entrypoints with YAML frontmatter can use it.

## Installation

### Install from a Git repository

After this repository is published on GitHub, use a [skills.sh](https://skills.sh)-compatible installer to copy selected skills into a project:

```bash
npx skills@latest add <github-owner>/<repository>
```

The installer lets you choose skills and target agents. It copies editable files; opt in to updates when you want them:

```bash
npx skills@latest update
```

### Manual installation for any agent

Copy one or more `skills/<topic>/<skill-name>/` directories into the skills location configured by your agent, and make sure it discovers `SKILL.md`. No plugin, account, telemetry, or runtime dependency is required.

## Current skills

| Category | Skill | Purpose | Invocation |
| --- | --- | --- | --- |
| `flow` | [`ask-qq`](./skills/flow/ask-qq/SKILL.md) | Explains this collection and recommends a next step for the current tutoring situation. | Explicit user invocation |
| `tutoring` | [`lesson-planner`](./skills/tutoring/lesson-planner/SKILL.md) | Blank starter skill for planning a tutoring session. | User or agent invocation |
| `practice` | [`practice-review`](./skills/practice/practice-review/SKILL.md) | Blank starter skill for reviewing self-practice and mistakes. | User or agent invocation |

## Project organization

The currently agreed directory layout is maintained in [docs/](./docs/README.md). Other design and convention documents will be added as decisions are made; `ask-qq` reads the available documentation when it explains the collection or recommends a flow.

## Inspiration

The project takes inspiration from [mattpocock/skills](https://github.com/mattpocock/skills): composable skill directories, `SKILL.md` entrypoints, and distribution through the `skills` installer. It deliberately omits that project's plugin manifests and all Claude Code/ChatGPT-specific constraints.
