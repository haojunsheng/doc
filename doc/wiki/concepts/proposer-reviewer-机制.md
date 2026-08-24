---
type: concept
title: Proposer-Reviewer 机制
created: 2026-08-24
updated: 2026-08-24
tags: [agent, memory, knowledge-update]
related: [压舱石母题, 隔离优于压缩]
sources: ["notes/20260815T113349--伴读-用户记忆和知识库__reading.md"]
---
# Proposer-Reviewer 机制

知识更新的双 Agent 审核闭环（PR 模式），提供知识更新的确定性保障。

## 四步流程

1. **Proposer**：生成知识变更提议
2. **Reviewer**：追溯到原始证据验证
3. **异源互审**：不同家族模型互相审核，降低共同盲区
4. **回证据填坑**：无法验证的变更丢弃，回到原始记录

## 设计哲学

LLM 判断需要"压舱石"——模型之外的锚点（解释器/原始记录/原始上下文/原始证据），以对抗 LLM 的系统性错误。
