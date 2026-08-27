# QQ's After-School Tutoring Skills

[中文](./README.md) · [Contributing](./CONTRIBUTING.md) · [MIT License](./LICENSE)

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

| Skill | Purpose | Invocation |
| --- | --- | --- |
| [`ask-qq`](./skills/learning/ask-qq/SKILL.md) | Explains this collection and recommends a next step for the current tutoring situation. | Explicit user invocation |
| [`lesson-planner`](./skills/learning/lesson-planner/SKILL.md) | Blank starter skill for planning a tutoring session. | User or agent invocation |
| [`practice-review`](./skills/learning/practice-review/SKILL.md) | Blank starter skill for reviewing practice and mistakes. | User or agent invocation |

## Layout convention

```text
skills/
└── learning/
    ├── ask-qq/
    │   └── SKILL.md
    ├── lesson-planner/
    │   └── SKILL.md
    └── practice-review/
        └── SKILL.md
```

The smallest portable skill format is:

```markdown
---
name: skill-name
description: One sentence saying what the skill does and when to use it.
---

# Skill title

Task-specific instructions for the agent.
```

Keep `name` equal to the directory name. `description` is for discovery and routing. Keep the body to guidance that materially changes an agent's decisions. Larger skills may add `references/`, `scripts/`, or `assets/` when needed, but product-specific configuration is not part of this portable format.

## Principles

- **Learner first:** understand the question, goal, and current feelings before optimizing anything.
- **Small and composable:** each skill has one job and can work with others.
- **Tool neutral:** skill files assume no specific model, CLI, plugin, or cloud service.
- **Editable and traceable:** everything lives in Git; the user chooses when to update.

## Inspiration

The project takes inspiration from [mattpocock/skills](https://github.com/mattpocock/skills): composable skill directories, `SKILL.md` entrypoints, and distribution through the `skills` installer. It deliberately omits that project's plugin manifests and all Claude Code/ChatGPT-specific constraints.

