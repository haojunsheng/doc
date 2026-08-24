---
type: concept
title: Harness 范式演进
created: 2026-08-24
updated: 2026-08-24
tags: [domain/ai, agent, harness, engineering]
related: [Harness（可靠性机制）, 上下文工程四机制, 四种更新载体, LangChain, OpenClaw]
sources: ["notes/20260809T172516--伴读-AI-Agent实战第一章__reading.md"]
---

# Harness 范式演进

## 定义

Harness 工程范式的层层包含关系：**提示 ⊂ 上下文 ⊂ Harness ⊂ Loop 工程**。每一层都包含并扩展了前一层的的能力边界。

## 范式层级

| 层级 | 范式 | 能力范围 | 示例 |
|------|------|---------|------|
| 1 | 提示（Prompt） | 单轮指令控制 | 系统提示词、few-shot 示例 |
| 2 | 上下文（Context） | 多轮记忆管理 | 消息列表、状态栏、压缩 |
| 3 | Harness | 约束/验证/纠正全链路 | 工具设计、护栏、评估闭环 |
| 4 | Loop 工程 | 持续学习与进化 | 四种更新载体、评估回路 |

## 量化证据

LangChain Terminal Bench 实验提供了硬数据支撑：

- **初始准确率**：52.8%
- **换 Harness 后准确率**：66.5%
- **模型未升级**：同样的基础模型

OpenAI 工程团队 10 倍效率提升也不靠模型升级，而是 Harness 工程。

## 实践含义

范式跃迁的顺序：
1. 先做好提示工程（最小杠杆）
2. 再做上下文管理（状态栏、Skills）
3. 再建 Harness（护栏、验证、纠正）
4. 最后做 Loop 工程（持续进化）

跳过层级直接做高阶范式，通常效果不佳。

## 与相关概念的关系

- [[Harness（可靠性机制）]]——本章的核心扩展公式：Agent = Model + Harness
- [[上下文工程四机制]]——上下文层的四种具体机制
- [[四种更新载体]]——Loop 工程层的四种进化路径