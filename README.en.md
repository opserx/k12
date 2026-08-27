# QQ's After-School Tutoring Skills

[中文](./README.md) · [Project organization](./skills/flow/ask-qq/references/project-organization.md) · [Contributing](./CONTRIBUTING.md) · [MIT License](./LICENSE)

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
| `practice` | [`listening-main-idea-practice`](./skills/practice/listening-main-idea-practice/SKILL.md) | A daily 10–15 minute self-practice for grasping the main idea in listening. | User or agent invocation |

## Project organization

Global design and convention documents are distributed with [`ask-qq`](./skills/flow/ask-qq/SKILL.md), in its [`references/`](./skills/flow/ask-qq/references/project-organization.md) directory. It currently contains only the directory layout; other documents will be added as decisions are made. `ask-qq` reads these documents when it explains the collection or recommends a flow.

## Global references

| File | Contents |
| --- | --- |
| [`project-organization.md`](./skills/flow/ask-qq/references/project-organization.md) | Responsibilities of the three skill directories, the skill naming convention, and the convention for global reference material. |

## Inspiration

The project takes inspiration from [mattpocock/skills](https://github.com/mattpocock/skills): composable skill directories, `SKILL.md` entrypoints, and distribution through the `skills` installer. It deliberately omits that project's plugin manifests and all Claude Code/ChatGPT-specific constraints.
