---
type: concept
title: Plan-and-Execute vs ReAct
created: 2026-08-24
updated: 2026-08-24
tags: [domain/ai, agent, architecture, reasoning]
related: [ReAct, Agent五层架构, 上下文漂移]
sources: ["notes/20260712T093000--学习计划-AI_Agent深度认知__plan.md"]
---

# Plan-and-Execute vs ReAct

## 定义

两种 Agent 执行范式：**先计划后执行（Plan-and-Execute）** 与 **边想边做（ReAct）** 的对比框架。

## 核心区别

| 维度 | Plan-and-Execute | ReAct |
|------|-----------------|-------|
| 执行模式 | 串行：先完整规划，再逐步执行 | 交织：Thought → Action → Observation 循环 |
| 灵活性 | 低——计划一旦确定难以调整 | 高——每步可根据观察结果调整 |
| 计算开销 | 高——一次性生成完整计划 | 低——按需生成下一步 |
| 失败模式 | 计划偏离现实 → 整条链失效 | 某步 Thought 错误 → 可能及时纠正 |
| 适用场景 | 目标明确、步骤固定的任务 | 目标模糊、需要探索的任务 |

## Plan-and-Execute 的陷阱

- **计划粒度过粗**：生成的计划缺少细节，执行时卡住
- **计划粒度过细**：token 消耗大，且每步都可能引入新的推理错误
- **无法适应变化**：执行过程中遇到意外情况时，难以动态调整

## ReAct 的优势与局限

ReAct 通过 "Thought-Action-Observation" 循环解决了 Plan-and-Execute 的僵化问题，但引入了新问题：
- **Thought 步骤可被错误推理带跑**（参见 [[上下文漂移]]）
- 每一步都需要 LLM 推理，延迟累积

## 在 wiki 中的位置

- [[Agent五层架构]] 认知层的核心设计选择
- [[ReAct]] 的前置对比框架，帮助理解 ReAct 为何提出
- 阶段一第 1 周子假设 H3 的核心辨析点
