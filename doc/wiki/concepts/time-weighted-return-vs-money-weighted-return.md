---
type: concept
title: Time-Weighted Return vs Money-Weighted Return
created: 2026-08-17
updated: 2026-08-17
tags: [domain/invest, finance-metrics, return-calculation]
related: [investor-gap, behavioral-cost-mind-the-gap]
sources: ["notes/20260614T091505--概念解剖-投资者回报差距（Investor Gap）__concept.md"]
---
# Time-Weighted Return vs Money-Weighted Return

两种回报口径的区别，是理解 **Investor Gap** 的技术基础。

## Time-Weighted Return（TWR）

- 按基金单位净值序列计算，**不考虑投资者的申赎行为**
- 反映基金经理的**投资能力**
- 计算公式：各持有期回报率几何平均，消除资金流影响

## Money-Weighted Return（MWR）

- 考虑投资者**资金流入流出的时机**，相当于 IRR（内部收益率）
- 反映投资者的**真实体验**
- 如果投资者在高点买入、低点赎回，MWR 会显著低于 TWR

## Investor Gap = TWR − MWR

| 场景 | TWR | MWR | Gap |
|------|-----|-----|-----|
| 买入持有，无申赎 | 年化 10% | 年化 10% | 0% |
| 高点申购、低点赎回 | 年化 10% | 年化 -2% | 12% |
| 定投平滑买入 | 年化 10% | 年化 7% | 3% |

## 中国市场实证（晨星 2012–2021）

- 75% 的偏股基金投资者 MWR < TWR
- 差距主要来源：申赎时机不当 + 追逐短期排名冠军
- 定投纪律可将 Gap 从 12% 压缩至 3% 左右

## 与其他概念的关系

- `[[concepts/投资者回报差距]]`：本文是 Investor Gap 的形式化定义基础
- `[[concepts/行为代价-mind-the-gap]]`：Mind the Gap 中的 2%/年 即 MWR 与 TWR 的平均差值
