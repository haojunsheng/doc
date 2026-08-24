---
type: concept
title: 纯推理 Agent
created: 2026-08-24
updated: 2026-08-24
tags: [domain/ai, agent, architecture]
related: [Agent五层架构, ReAct, 工具描述敏感性]
sources: ["notes/20260712T093000--学习计划-AI_Agent深度认知__plan.md"]
---

# 纯推理 Agent

## 定义

不依赖外部工具调用的 Agent 类型，仅通过 LLM 内部的推理能力（如 Chain of Thought、Tree of Thought）来解决问题。挑战了"Agent 必须调用工具"的直觉定义。

## 与工具型 Agent 的关系

[[H1]] 初始假设提出"LLM 当大脑 + 工具当手脚 + 记忆当经验"的三分法，但纯推理 Agent 是这一框架的反例：

```
常见直觉：Agent = LLM（推理）+ 工具（执行）

实际分类：
├── 纯推理 Agent：无工具调用，仅靠 LLM 内部推理完成（如数学推理、逻辑谜题）
└── 工具型 Agent：调用外部工具执行动作（如搜索、代码执行、API 调用）
    └── ReAct 范式：推理与行动交替进行
```

## 关键特征

- **能力边界**：纯推理 Agent 擅长结构化问题（数学、逻辑），但在需要实时信息或物理世界交互的任务上力不从心
- **评估标准**：准确率 vs 任务完成率，二者衡量的是不同维度的"智能"
- **演进方向**：大多数实用 Agent 是纯推理 + 工具调用的混合体

## 在 wiki 中的位置

- [[Agent五层架构]] 感知层/认知层的边界问题：没有工具时，"行动层"是否还存在？
- [[ReAct]] 的前置概念——理解 ReAct 的前提是知道"没有工具的纯推理"长什么样
