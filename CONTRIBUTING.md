# Contributing

Each skill lives in `skills/<category>/<skill-name>/` and must contain a `SKILL.md`. See [the project organization document](./docs/README.md) for the current categories.

- Use lowercase kebab-case names.
- Include YAML frontmatter with `name` and a focused `description`.
- Keep the entrypoint short and tool-neutral. Put only durable, task-specific guidance in it.
- Add scripts, references, or assets only when the skill truly needs them.
- Do not place product-specific manifests in a skill. Adapters belong outside this portable collection.

Before opening a pull request, make sure every `SKILL.md` has valid frontmatter and that its instructions are understandable without a particular agent product.
