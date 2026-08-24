---
type: entity
title: Memobase
created: 2026-08-24
updated: 2026-08-24
tags: [agent, memory, framework]
related: [Mem0, 双层记忆架构]
sources: ["notes/20260815T113349--伴读-用户记忆和知识库__reading.md"]
---
# Memobase

Memobase 是一个用户记忆框架，采用**用户画像（Profile）+ 事件记忆（Event Memory）** 的双结构：

- **Profile**：可配置槽位的稳定用户画像
- **Event Memory**：时间线上的事件记录

采用缓冲批处理策略摊薄 LLM 调用成本。与 Mem0 相比，Memobase 的结构更强调"画像的稳定性"与"事件的时间性"之间的分离。
