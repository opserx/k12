# Contributing

Each skill lives in `skills/<category>/<skill-name>/` and must contain a `SKILL.md`. See [the project conventions](./skills/flow/k12-ask-qq/references/project-conventions.md) for the current categories and data dictionary.

- Use lowercase kebab-case names and follow the `k12-aspect-purpose[-subject]` convention in the project conventions.
- Include YAML frontmatter with `name` and a focused `description`.
- Keep the entrypoint short and tool-neutral. Put only durable, task-specific guidance in it.
- Add scripts, references, or assets only when the skill truly needs them.
- Do not place product-specific manifests in a skill. Adapters belong outside this portable collection.
- To make a skill exportable, use the internal `k12-export-enable` capability; it adds the skill's own `## 导出` instructions and `references/export-template.md`.

Before opening a pull request, make sure every `SKILL.md` has valid frontmatter and that its instructions are understandable without a particular agent product.
