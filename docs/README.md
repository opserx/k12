# 项目组织规范

`docs/` 用于保存已经达成共识的项目级说明。当前只记录目录组织；随着项目发展，再按需补充其他设计或规范文档。

```text
skills/
├── flow/       # 流程、路由与跨类别协作
├── tutoring/   # 人与 Agent 一起进行的课外辅导
└── practice/   # 学习者自我练习、复盘与反馈
```

- `flow`：放置流程、路由和跨类别协作技能。`ask-qq` 位于此处；以后所有与流程有关的 skills 都放在这里。
- `tutoring`：放置由家长、老师或 Agent 参与的课外辅导技能。
- `practice`：放置学习者自己练习、复盘和获取反馈的技能。

每个 skill 都放在 `skills/<category>/<skill-name>/`，并以目录内的 `SKILL.md` 作为入口。分类用于发现和维护，不改变 skill 名称，也不要求 Agent 运行时支持分类。
