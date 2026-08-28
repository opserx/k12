# QQ's After-School Tutoring Skills

[中文](./README.md) · [GitHub](https://github.com/opserx/k12) · [MIT License](./LICENSE)

This is a collection of skills for middle-school after-school tutoring in mainland China. Install the skill you need below, then invoke it directly in your agent.

## Installation

This repository keeps one skill per directory. [skills.sh](https://skills.sh) installs them as ordinary local files you can inspect and edit; it does not change them in the background.

### Install selected skills

```bash
npx skills@latest add opserx/k12
```

Choose the skills and target agent when prompted.

### Install the complete collection

```bash
npx skills@latest add opserx/k12 --skill '*'
```

This selects every skill currently in this repository; choose the target agent when prompted.

### Update

```bash
npx skills@latest update
```

This checks and updates every skill installed through `skills.sh` to the latest version from its source. If you installed skills from other sources too, they are checked and updated as well. As with [Matt Pocock's skills](https://github.com/mattpocock/skills), updates happen only when you run the command.

You can also copy skill directories into your agent's skills directory. A manual copy has no tracked source, so you must compare and update it yourself.

## Current skill index

Choose the skill that fits your current learning need.

<!-- current-skill-index:start -->
| Category | Skill | Purpose | Invocation |
| --- | --- | --- | --- |
| `flow` | [`k12-ask-qq`](./skills/flow/k12-ask-qq/SKILL.md) | Explains this collection and recommends a next step for the current tutoring situation. | Explicit user invocation |
| `practice` | [`k12-listening-idea-practice`](./skills/practice/k12-listening-idea-practice/SKILL.md) | A daily 10–15 minute main-idea listening practice with four selectable sub-exercises. | User or agent invocation |
| `practice` | [`k12-reading-deepth-english`](./skills/practice/k12-reading-deepth-english/SKILL.md) | English close reading from an image or text, with contextual dialogue and an on-demand vocabulary list. | User or agent invocation |
| `practice` | [`k12-writing-word-chinese`](./skills/practice/k12-writing-word-chinese/SKILL.md) | Chinese synonym and near-synonym idiom practice through three-to-three matching. | User or agent invocation |
| `tutoring` | [`k12-writing-rewrite-chinese`](./skills/tutoring/k12-writing-rewrite-chinese/SKILL.md) | Chinese revision practice for information, pacing, and expression, with a model text. | User or agent invocation |
| `tutoring` | [`k12-writing-short-chinese`](./skills/tutoring/k12-writing-short-chinese/SKILL.md) | Chinese prompted fragment writing, from a prompt and draft to revision and model text. | User or agent invocation |
<!-- current-skill-index:end -->

## Global references

| File | Contents |
| --- | --- |
| [`project-conventions.md`](./skills/flow/k12-ask-qq/references/project-conventions.md) | Skill categories, naming conventions, and the `namespace`, `aspect`, `subject`, and `category` data dictionary. |
