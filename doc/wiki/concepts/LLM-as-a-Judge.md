---
type: concept
title: LLM-as-a-Judge
created: 2026-08-24
updated: 2026-08-24
tags: [domain/ai, AI-Agent, evaluation]
related: [评估三维度, Agent-LLM-上下文-工具]
sources: ["notes/20260809T155341--深度研究-AI-Agent架构设计_deep-learn.md"]
---

# LLM-as-a-Judge

## 定义

用 LLM 替代人工做评估判定的方法，是评估三维度中"评判方法"维度的一个重要子问题。

## 核心结论

**LLM-as-a-Judge 的可靠性取决于 rubric 设计而非裁判模型本身**。

这意味着：
- 换一个更强的模型不一定提高评估质量
- 好的 rubric（评判标准）设计比选对模型更重要
- rubric 需要具体、可操作、覆盖关键维度

## Rubric 设计要点

| 要点 | 说明 |
|------|------|
| 具体化 | 避免模糊标准，改为可检查的条目 |
| 多维度 | 覆盖准确性、完整性、格式、安全等维度 |
| 负例明确 | 不仅要说明什么是对的，还要说明什么是错的 |
| 权重清晰 | 各维度有不同重要性时要明确权重 |

## 验证方式

跑 `chapter7/` 评估实验，改 rubric 观察评判结果变化。

## 关联概念

- [[评估三维度]]——本概念属于"评判方法"维度
- [[SFT记忆与RL泛化]]——rubric 设计本身也可以视为一种轻量级 SFT