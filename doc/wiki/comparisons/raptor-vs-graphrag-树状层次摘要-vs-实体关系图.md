---
type: comparison
title: RAPTOR vs GraphRAG — 树状层次摘要 vs 实体关系图
created: 2026-08-24
updated: 2026-08-24
tags: [agent, rag, comparison, knowledge-organization]
related: [Agentic RAG, 双层记忆架构]
sources: ["notes/20260815T113349--伴读-用户记忆和知识库__reading.md"]
---
# RAPTOR vs GraphRAG — 树状层次摘要 vs 实体关系图

## 对比表

| 维度 | RAPTOR | GraphRAG |
|------|--------|----------|
| 组织方式 | 树状层次摘要 | 实体关系图 |
| 索引结构 | 自底向上聚类摘要成树 | 实体 + 关系三元组 |
| 推理能力 | 层次摘要支持多粒度 | 多跳推理 + 实体消歧 |
| 局限 | — | 语义降级：条件逻辑、时间依赖压成三元组后丢失 |

## 互补关系

GraphRAG 的语义降级问题提示：单一结构化索引无法覆盖所有查询类型，需分层互补。
