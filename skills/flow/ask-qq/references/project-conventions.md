# 项目规范

`skills/flow/ask-qq/references/` 是本项目全局设计与规范文档的统一位置，会随 `ask-qq` 一起安装。本文记录已经达成共识的目录组织、命名与数据定义；随着项目发展，再按需补充具体约定。

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

## 技能命名规范

普通 skill 的名称使用：

```text
<方面>-<技能目的>[-<学科>]
```

- **方面**：训练主要锻炼的听、说、读、写中的某一方面；在英文命名和字段中统一使用 `aspect`，例如 `listening`、`speaking`、`reading`、`writing`。
- **技能目的**：这个 skill 具体要帮助完成的动作或达到的结果，例如 `prompted-practice`、`language-revision`、`synonym-matching`、`lesson-planning`。
- **学科**：适用范围受某一学科限制时加在最后，例如 `chinese`、`english`、`math`。方面本身已包含学科，或 skill 跨学科时省略。

目录分类与名称的方面是两个维度：分类决定文件放在 `flow`、`tutoring` 还是 `practice`；方面说明它训练什么。名称让安装后扁平展示的 skill 仍然可识别。

`ask-qq` 是唯一例外：它是面向用户的全局路由名称，不使用这一格式。

## 数据字典

| 中文字段 | 英文字段 | 定义 | 示例或规则 |
| --- | --- | --- | --- |
| 方面 | `aspect` | 这项技能主要锻炼的听、说、读、写中的一个方面。它用于名称的第一段，描述训练对象，不描述使用方式。 | `listening`、`speaking`、`reading`、`writing`。不要使用 `practice`、`tutoring` 或 `flow`，它们是分类。 |
| 技能目的 | `purpose` | 技能希望完成的具体动作或结果。它用于名称的第二段。 | `main-idea-practice`、`prompted-practice`、`language-revision`。 |
| 学科 | `subject` | 技能内容所限定的学科。它是可选的名称最后一段。 | `chinese`、`english`、`math`。方面本身已含学科，或技能不区分／跨越学科时省略。 |
| 技能分类 | `category` | 技能在仓库中的目录分类，表示协作或使用方式，不表示训练的方面。 | `flow`、`tutoring`、`practice`，分别对应流程路由、有人参与的辅导、学习者自我练习。 |

### 命名示例

| 用途 | 分类 | 名称 |
| --- | --- | --- |
| 练习从听力材料中抓住中心 | `practice` | `listening-main-idea-practice` |

### 中文写作技能

LuneTree 的 `chinese-writing-practice` 已拆为以下四个独立 skill，不保留父 skill：

| 原流程 | 分类 | 名称 |
| --- | --- | --- |
| 命题写作 | `tutoring` | `writing-prompted-practice-chinese` |
| 语言提升 | `tutoring` | `writing-language-revision-chinese` |
| 近义词练习 | `practice` | `writing-synonym-matching-chinese` |
| 导出材料 | `flow` | `writing-session-export-chinese` |

## `references/` 目录规范

`ask-qq/references/` 保存本项目的全局设计、规范与长期约定；`ask-qq` 是读取和解释这些资料的统一入口。

- 所有全局设计和规范文档都放在此目录，不再使用仓库根目录的 `docs/` 作为同类资料的位置。
- 根目录的中英文 README 必须维护此目录中全局参考资料的索引，并在新增或删除资料时同步更新。
- `ask-qq/SKILL.md` 必须链接资料，并说明什么情形下应读取它；不要默认加载与当前问题无关的资料。
- 资料只记录会改变项目级判断的具体事实、约定或流程。
- 单独安装 `ask-qq` 时，这些全局资料会一同安装；单独安装其他 skill 时不能假定这些资料也存在。此类 skill 必须保持自身可用，或携带自己的必要参考资料。
