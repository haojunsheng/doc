---
type: concept
title: MCP
created: 2026-08-24
updated: 2026-08-24
tags: [domain/ai,

sources: ["notes/20260809T155341--深度研究-AI-Agent架构设计_deep-learn.md"]
---FILE: wiki/concepts/MCP.md---
---
type: concept
title: MCP
created: 2026-08-24
updated: 2026-08-24
tags: [domain/ai, AI-Agent, tool-protocol, interoperability]
related: [五类工具划分, Agent-LLM-上下文-工具, 上下文工程四机制]
sources: ["notes/20260809T155341--深度研究-AI-Agent架构设计_deep-learn.md"]
---

# MCP（Model Context Protocol）

## 定义

Model Context Protocol（模型上下文协议），是 Agent 工具互操作的标准协议。

## 核心价值

**MCP 的价值是互操作标准而非新能力**——它不带来 Agent 不能做的事，但显著降低给 Agent 加一个新工具的工程成本。

## 出现前后的工程成本差

| 维度 | 无 MCP | 有 MCP |
|------|--------|--------|
| 工具定义 | 每家自定义 schema | 统一 schema 规范 |
| 集成成本 | 每个工具单独对接 | 标准接口复用 |
| 安全审核 | 逐工具审核 | 协议级安全框架 |
| 可移植性 | 绑定特定平台 | 跨平台通用 |

## 与五类工具的关系

MCP 主要服务于**协作类工具**（与其他 Agent/服务交互），但也影响其他类别的工具定义和传输格式。

## 关联概念

- [[五类工具划分]]——MCP 是协作类工具的标准协议
- [[上下文工程四机制]]——MCP 标准化的工具描述也属于 Skills 按需加载的范畴