# Agent 原生语音能力调研

调研日期：2026-08-28。本文只记录已核对的厂商一手资料，供 `k12-listening-idea-practice` 的运行时语音章节引用；不是面向学习者的说明。

## 结论和运行时决策

不要根据对话名称、模型名称或用户自述猜测 Agent。先检查当前会话实际已暴露的工具及其 schema，再按下表处理。

| 当前 Agent / 可用能力 | 结论 | 本 skill 应做什么 |
| --- | --- | --- |
| Grok，且能调用 `voice_list_voices` 与 `voice_generate_speech` | 可以生成语音。`voice_generate_multi_speech` 是可选的多片段快捷能力。 | 固定以 `voice_generate_speech`、`voice: luna`、`language: zh` 和以 `.mp3` 结尾的工作区 `dest_path` 生成短片段；不传 `with_timestamps`，也不再每次列出或筛选声音。若宿主无法播放或呈现音频，按不能生成处理。 |
| ChatGPT/Codex | ChatGPT 桌面端有供用户与 Agent 对话的 Voice UI；现有文档没有把它定义为 Codex skill 可调用的、可生成并播放任意音频片段的内建工具。 | 不要把 ChatGPT Voice 当作 TTS 工具，也不要私自调用 OpenAI API、索取/使用 API key 或用系统 `say` 代替。除非当前会话实际已暴露一个 TTS/播放工具及其 schema，否则输出“当前 Agent 不能生成音频，无法进行这次听力练习。” |
| Claude Code | 内建 `/voice` 是把用户录音转写到输入框的**语音听写**，不是 Agent 的语音输出；其完整 built-in tool reference 也未列出 TTS/播放工具。 | 输出“当前 Agent 不能生成音频，无法进行这次听力练习。”；不得把 shell TTS 或另接 API 伪装成 Claude Code 原生能力。 |
| 其他 Agent，或上述 Grok 工具缺失/调用被拒绝/生成失败 | 不能证明有可用的原生语音生成能力。 | 直接输出“当前 Agent 不能生成音频，无法进行这次听力练习。”不要改成阅读理解，也不要降级为文字模拟音频。 |

这里的“可用”同时要求：能生成**中文**语音、能将结果交给当前客户端播放或呈现、调用未被权限/配额阻止。任一条件不成立即按不能生成处理；不要为规避限制新装插件、MCP、SDK 或转用第三方服务。

## Grok / xAI

### 关于三个 Grok 工具名

用户提到的 `voice_generate_speech`、`voice_list_voices`、`voice_generate_multi_speech` **不是 xAI 公共 REST API 文档中的 endpoint 名称**。截至本调研，公开 API 对应的是：

- `POST /v1/tts`：生成一段语音；`text` 上限 15,000 字符，`language` 需要 BCP-47 代码或 `auto`，并明确接受 `zh`。
- `GET /v1/tts/voices`：列出可用 TTS 声音；详情可由 `GET /v1/tts/voices/{voice_id}` 获得。
- `wss://api.x.ai/v1/tts`：每次收到 `audio.done` 后可在同一连接继续发送下一段 `text.delta`，即公开 API 的 multi-utterance 方式。

因此，这三个 `voice_*` 名称应视为 Grok 产品宿主可能映射出的会话工具：**只在当前工具清单确实出现时才调用，并完全按该工具的实时 schema 传参；不得从 REST 字段名臆造参数。** 这既能适配 Grok 的工具接口，也避免把 `voice_id`、`language`、`text` 等 REST 字段错误地塞进另一个 schema。

### 可执行规则

1. 固定使用 `luna` 与 `language: zh`，不再每次调用 `voice_list_voices`。会话目录已标 `luna` 为女性，官方已标 gentle / patient / nurturing，本 skill 固定使用 `luna` + `language=zh`。备选为 `carina`、`liora`、`aurora`；不要使用偏活泼的 `eve`。
2. 将训练材料切成自然、短的中文语义片段。一次练习需要多段独立音频时，仅在 `voice_generate_multi_speech` 已暴露时使用它；否则以 `voice_generate_speech` 逐段生成。传入 `.mp3` 结尾的工作区 `dest_path`，不传 `with_timestamps`；有重复句子时必须保留原文一致性，不补写内容。
3. 会话工具没有独立的风格、语速或 instructions 字段。需要略慢、略柔时，把 `<slow>`、`<soft>`、`[pause]` 写进 text；不得编造这些字段，也不得把公开 REST API 的字段名作为会话参数。会话字段是 `voice`，不是 `voice_id`。
4. 优先用当前宿主的 MP3 返回/播放机制向学生播报。公开 xAI TTS 返回音频字节或流；Web 示例由调用方把结果交给 `Audio` 元素播放，所以生成与播放是两件要分别确认的事。

官方依据：[xAI Voice REST reference](https://docs.x.ai/developers/rest-api-reference/inference/voice)（`/v1/tts`、`zh`、声音列表和 WebSocket multi-utterance）、[xAI Text to Speech guide](https://docs.x.ai/developers/model-capabilities/audio/text-to-speech)（TTS 格式、播放示例与 15,000 字符限制）。

## ChatGPT / Codex / OpenAI

OpenAI API 确实提供 `POST /v1/audio/speech`：`gpt-4o-mini-tts` 可接收 `input`、`voice`、`instructions`，支持中文输入，且 instructions 可以控制语气、语速等。声音当前“optimized for English”，所以不能承诺固定内置声音就是理想的中文温柔女声。该 API 需要调用方具备 API 认证和音频处理路径，不等于 ChatGPT 或 Codex skill 在运行时已获一个 TTS 工具。

ChatGPT 的 Voice 文档描述的是用户选择 Voice 控件、授权麦克风、与 Work/Codex 对话；它说 Voice in Work and Codex 仅在 ChatGPT 桌面端可用，并未给 Codex skill 提供 `voice_generate_speech` 一类的可调用工具。故本 skill 的保守判定应以当前会话工具为准：没有明确、已授权的 TTS 与播放工具，就不能生成。

如果未来 Codex 宿主在会话中直接提供 TTS 工具，才可以按**那一工具的 schema**使用它，并要求中文温柔女声；不得把 API 的 HTTP/SDK 示例当作可直接调用的 Agent 工具。任何提供给最终用户的 OpenAI TTS 音频还需要明确披露为 AI 生成声音。

官方依据：[OpenAI Text-to-speech guide](https://developers.openai.com/api/docs/guides/text-to-speech)（speech endpoint、语音/指令、中文支持、英文优化与 AI 声音披露）、[OpenAI Create speech reference](https://developers.openai.com/api/reference/resources/audio/subresources/speech/methods/create)、[ChatGPT Voice help](https://help.openai.com/en/articles/20001274)、[Use Voice with Work or Codex](https://help.openai.com/en/articles/20001275).

## Claude Code / Anthropic

Claude Code 的官方 Voice 文档限定为“Speak your prompts”：录音被传到 Anthropic 服务器转写到 prompt 输入，且要求 Claude.ai 登录、本地麦克风等。它没有描述任何文本转语音或 Agent 输出播放能力。其完整 built-in tools 表也列出了 Claude Code 的工具，并说明自定义工具须通过 MCP 连接；其中没有 TTS 或音频播放工具。

所以 Claude Code 不应被识别成能原生播报的候选运行时。除非会话**已经**另行暴露、并允许一个语音工具（这种情况属于该工具的能力，不是 Claude Code 内建 Voice），一律报告不能生成。

官方依据：[Claude Code Voice dictation](https://code.claude.com/docs/en/voice-dictation)、[Claude Code tools reference](https://code.claude.com/docs/en/tools-reference).
