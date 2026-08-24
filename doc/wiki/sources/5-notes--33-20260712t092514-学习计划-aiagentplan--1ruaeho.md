---
type: source
title: AI Agent 学习计划（按肖璟方法论设计）
authors: [Yao, et al.]
year: 2022
url: "https://arxiv.org/abs/2210.03629"
venue: arXiv
tags: ["domain/ai", "type/plan", "methodology", "paper", "agent", "survey", "reasoning"]
related: ["假设驱动研究", "DIKW模型-研究方法论", "五维分析框架-肖璟", "景气度指标体系", "Agent五层架构", "ReAct", "AI幻觉"]
sources: ["notes/20260712T092514--学习计划-AI_Agent__plan.md"]
created: 2026-08-24
updated: 2026-08-23
---

# ReAct: Synergizing Reasoning and Acting in Language Models

**作者：** Yao, Tan, et al.  
**链接：** https://arxiv.org/abs/2210.03629

## 简介

Agent 推理+行动的经典论文。提出 LLM 可以像人类一样，通过"思考（Reason）"和"行动（Act）"交替进行来解决问题，而非先规划再执行的串行的两阶段模式。

## 核心方法

ReAct = Reasoning + Acting，让 LLM 在每一步都同时输出：
- **Thought**（思考）：当前状态的分析
- **Action**（行动）：调用的工具
- **Action Input**（行动输入）：工具参数
- **Observation**（观察）：工具返回的结果

这种"边想边做"的范式解决了纯规划（容易偏离实际）和纯反应（缺乏全局视野）各自的问题。

## 在 wiki 中的位置

- [[Agent五层架构]] 推理/规划层的核心方法
- [[假设驱动研究]] 的工程技术类比：假设=Thought，实验=Action，反馈=Observation
- [[学习验证五问]] Q2 中"工程问题 vs 能力问题"的讨论与此方法直接相关
