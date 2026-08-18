---
type: entity
title: Kenneth French（肯尼斯·福雷）
tags: [domain/invest, finance-theory, person]
related: [Fama-French三因子模型, SMB, HML, 阿尔法是解释剩余, fama]
created: 2026-08-18
updated: 2026-08-18
sources: ["notes/20260614T115958--qa-阿尔法消失又回来__qa.md", "notes/20260614T091508--概念解剖-阿尔法的本质与幻象__concept.md"]
---

# Kenneth French（肯尼斯·福雷）

达特茅斯学院统计学教授，与 Eugene Fama 于 1992 年共同提出**Fama-French 三因子模型**，重新定义了 Alpha 的测量边界。

## 核心贡献

**Fama-French 三因子模型**在 CAPM 单一市场因子的基础上，增加了两个系统性风险因子：

```
Rp = α + β1(Rm) + β2(SMB) + β3(HML) + ε
```

- **SMB（Small Minus Big）**：规模因子，衡量小盘股相对于大盘股的超额收益
- **HML（High Minus Low）**：价值因子，衡量价值股相对于成长股的超额收益

## 对 Alpha 概念的冲击

三因子模型揭示了大量此前被认为是 Alpha 的收益，实际上是基金经理对规模因子或价值因子的隐性暴露。这一发现大幅收缩了 Alpha 的定义边界，推动了从"主动管理能力"向"因子暴露分析"的范式转变。

## 后续工作

2010 年代，Fama 与 French 进一步扩展到五因子模型，加入盈利因子（RMW）和投资因子（CMA）。每个新因子都进一步蚕食 Alpha 的边界，强化了"阿尔法是解释剩余"的动态定义。

## 在本 Wiki 中的角色

Fama-French 模型是理解"阿尔法消失"现象的核心机制——每当有新的因子被发现，原先被认为是超额收益的部分就被重新归类为风格暴露（Beta）。

参见 [[Fama-French三因子模型]]、[[SMB]]、[[HML]]、[[尤金-法玛-eugene-fama]]。