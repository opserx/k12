# QQ's After-School Tutoring Skills

[中文](./README.md) · [GitHub](https://github.com/opserx/k12) · [MIT License](./LICENSE)

This is a collection of skills for middle-school after-school tutoring. Install the skill you need below, then invoke it directly in your agent.

## Installation

Install with [skills.sh](https://skills.sh):

```bash
npx skills@latest add opserx/k12
```

Choose the skills and target agent when prompted. To update installed skills later:

```bash
npx skills@latest update
```

You can also copy the skill directories you need into your agent's skills directory.

## Current skill index

Choose the skill that fits your current learning need.

<!-- current-skill-index:start -->
| Category | Skill | Purpose | Invocation |
| --- | --- | --- | --- |
| `flow` | [`k12-ask-qq`](./skills/flow/k12-ask-qq/SKILL.md) | Explains this collection and recommends a next step for the current tutoring situation. | Explicit user invocation |
| `flow` | [`k12-export`](./skills/flow/k12-export/SKILL.md) | Exports the current learning materials to chat or PDF using each source skill's template. | User or agent invocation |
| `practice` | [`k12-listening-main-idea-practice`](./skills/practice/k12-listening-main-idea-practice/SKILL.md) | A daily 10–15 minute self-practice for grasping the main idea in listening. | User or agent invocation |
| `practice` | [`k12-writing-synonym-matching-chinese`](./skills/practice/k12-writing-synonym-matching-chinese/SKILL.md) | Chinese synonym and near-synonym idiom practice through three-to-three matching. | User or agent invocation |
| `tutoring` | [`k12-writing-language-revision-chinese`](./skills/tutoring/k12-writing-language-revision-chinese/SKILL.md) | Chinese revision practice for information, pacing, and expression, with a model text. | User or agent invocation |
| `tutoring` | [`k12-writing-prompted-practice-chinese`](./skills/tutoring/k12-writing-prompted-practice-chinese/SKILL.md) | Chinese prompted fragment writing, from a prompt and draft to revision and model text. | User or agent invocation |
<!-- current-skill-index:end -->

## Global references

| File | Contents |
| --- | --- |
| [`project-conventions.md`](./skills/flow/k12-ask-qq/references/project-conventions.md) | Skill categories, naming conventions, and the `namespace`, `aspect`, `subject`, and `category` data dictionary. |
