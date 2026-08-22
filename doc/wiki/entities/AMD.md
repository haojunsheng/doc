---
type: entity
title: AMD
tags: [entity, amd, gpu, semiconductor, us-tech, competitor]
related: [英伟达-nvidia, GPU作为AI专用加速器, CUDA生态锁定]
created: 2026-08-22
updated: 2026-08-22
sources: ["notes/20260628T153927--qa-英伟达AI顺风车坐稳了吗__qa.md"]
---
# AMD

Advanced Micro Devices（AMD）是全球主要的 GPU 和 CPU 制造商，是英伟达在 GPU 市场的主要竞争对手。

## 基本信息

| 属性 | 内容 |
|------|------|
| 全称 | Advanced Micro Devices, Inc. |
| 核心业务 | CPU、GPU（Radeon / Instinct 系列）、ACAP 自适应计算平台 |
| 市场定位 | GPU 第二供应商，试图在 AI 训练市场分一杯羹 |

## 与英伟达的关键差距

### 硬件层面
- 能够设计 GPU，技术上可对标英伟达产品
- 但价格仅为英伟达的一半，反映品牌溢价和技术差距

### 生态层面（关键差距）
- **没有 CUDA 替代品**：CUDA 平台已被绝大多数 AI 模型训练采用，形成强大的生态锁定
- 客户切换平台需重写算法、重训模型，转换成本极高
- 这是 AMD 难以撼动英伟达市场地位的根本原因

参见 [[concepts/CUDA生态锁定]]。

## 投资意义

AMD 的存在说明 GPU 硬件本身并非不可复制的护城河。英伟达的真正壁垒在于 CUDA 软件生态——这解释了为何 AMD 即使能做出性能相近的芯片，也无法抢夺英伟达的市场份额。

这也印证了 [[concepts/护城河策略]] 中的"转换成本"维度：无形资产（生态）比有形资产（硬件）更难被竞争者侵蚀。

## 相关页面

- [[entities/英伟达-nvidia]] — 主要竞争对手
- [[concepts/CUDA生态锁定]] — AMD 无法跨越的生态壁垒
- [[concepts/GPU作为AI专用加速器]] — 硬件层面的竞争基础