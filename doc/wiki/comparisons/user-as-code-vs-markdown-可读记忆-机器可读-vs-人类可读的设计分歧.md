---
type: comparison
title: User as Code vs Markdown 可读记忆 — 机器可读 vs 人类可读的设计分歧
created: 2026-08-24
updated: 2026-08-24
tags: [agent, memory, comparison, representation]
related: [User-as-Code, OpenViking]
sources: ["notes/20260815T113349--伴读-用户记忆和知识库__reading.md"]
---
# User as Code vs Markdown 可读记忆 — 机器可读 vs 人类可读的设计分歧

## 对比表

| 维度 | User as Code | Markdown 可读记忆（OpenViking） |
|------|-------------|-------------------------------|
| 存储介质 | 带类型 Python 对象 | Markdown 纯文本 |
| 读者 | 解释器 | 用户自己 |
| 可编辑性 | 需重新生成 | 可直接编辑修正 |
| 确定性 | 约束以代码硬编码 | 依赖 LLM 解析 |
| 演化适应性 | 类型预知，难以适应新结构 | 灵活，可随时补充 |

## 根本分歧

这一张力反映了 Agent 系统中"机器可读"vs"人类可读"的根本分歧：

- **User as Code** 路线：以确定性换取可执行性，牺牲人类可读性
- **OpenViking** 路线：以人类可审可回滚换取长期可维护性
