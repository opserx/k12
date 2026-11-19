---
name: |-
  k-12-tool-mcp
description: |-
  工具说明
notion_page_id: 41d2b3b7-98a9-8020-a871-ff7308b7ed71
---

# 工具调用和说明

## 月树mcp工具

使用命令行方式调用

```shell
脚本：`/home/box/notes-save-class-notes-20261112-revised-1312/https_mcp.py`

在脚本目录运行：
- `python3 https_mcp.py` 或 `python3 https_mcp.py probe`：仅测 TCP 连接与 TLS 握手延迟。
- `python3 https_mcp.py init`：完成最小 MCP 握手。
- `python3 https_mcp.py tools`：列出工具。
- `python3 https_mcp.py call <tool_name> '[json_args]'`：调用指定工具，参数为 JSON 对象，可省略。

严格校验 TLS，使用 CA `/home/box/mcp-http-client/certs/lune-mcp-ca.crt`。
```

<p />
