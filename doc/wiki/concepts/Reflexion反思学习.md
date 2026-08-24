---
type: concept
title: Reflexion 反思学习
created: 2026-08-24
updated: 2026-08-24
tags: [domain/ai, agent, memory, learning]
related: [Agent五层架构, 失败日志, 工具描述敏感性]
sources: ["notes/20260712T093000--学习计划-AI_Agent深度认知__plan.md"]
---

# Reflexion 反思学习

## 定义

Agent 利用自身失败经验形成内部反思，进而调整后续行为策略的学习机制。由 Shinn et al.（2023）在论文 *"Reflexion: Language Agents with Reinforcement Learning"* 中提出，是记忆层中区别于 RAG 的另一种经验积累路径。

## 与 RAG 的关键区别

| 维度 | RAG | Reflexion |
|------|-----|-----------|
| 解决的问题 | 事实检索（"是什么"） | 策略迭代（"怎么做更好"） |
| 记忆形式 | 外部向量存储 | 内部反思更新 |
| 适用范围 | 知识型问答 | 任务型执行 |
| 局限性 | 无法处理"方法错误" | 依赖足够多的失败样本 |

## 核心机制

```
执行任务 → 失败 → 生成反思（"下次应该…"）→ 将反思存入工作记忆 → 下次执行时调用
```

Reflexion 的本质是让 Agent 把每次失败转化为可复用的内部知识，而非像 RAG 那样只是从外部检索事实。

## 在 wiki 中的位置

- [[Agent五层架构]] 记忆层"经验学习"子项
- [[失败日志]] 的自动化版本——人写失败日志，Reflexion 让 Agent 自己写
- [[上下文漂移]] 的缓解手段之一：通过反思识别"之前在这步丢了目标"

## 相关论文

- Shinn et al. (2023), *Reflexion: Language Agents with Reinforcement Learning*, arxiv:2303.11366
