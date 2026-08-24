---
type: entity
title: Nacos
created: 2026-08-24
updated: 2026-08-24
tags: [service-discovery, configuration, alibaba, spring-cloud]
related: [凤凰架构, ZooKeeper, etcd, Spring Cloud]
sources: ["notes/20260809T155731--深度研究-凤凰架构：构建可靠的大型分布式系统_deep-learn.md"]
---
# Nacos

阿里巴巴开源的服务发现和配置管理平台，面向云原生微服务架构设计。

## AP/CP 双模设计

Nacos 支持按服务命名空间切换一致性模型：

- **AP 模式**（可用+分区容错）：用于服务发现，路由错误可重试自愈
- **CP 模式**（一致+分区容错）：用于配置管理，配置错误是全局事故

这一双模设计直接验证 [[深度研究-凤凰架构构建可靠的大型分布式系统deep-learn]] W2 子假设 2.2：「注册中心要 AP、配置中心要 CP——因为路由错误可以重试自愈，配置错误是全局事故。这不是口味之争，是失败代价不对称。」

## 核心功能

- **服务注册与发现**：DNS 和 RPC 两种模式
- **动态配置**：推送式更新，无需重启
- **服务元数据**：健康检查、权重、集群信息
- **Spring Cloud 集成**：`spring-cloud-starter-alibaba-nacos` 原生支持

## 与替代方案对比

| 维度 | Nacos | ZooKeeper | etcd |
|------|-------|-----------|------|
| 主要用途 | 服务发现 + 配置 | 通用协调 | K8s backing store |
| 一致性 | AP/CP 可切换 | 仅 CP | 仅 CP |
| 生态 | Alibaba/Spring Cloud | Hadoop/Kafka | Kubernetes |
| 推送机制 | 长轮询 + 推送 | Watch + 通知 | Watch |

## 学习计划中的角色

W2 动手验证要求阅读 Nacos 的 AP/CP 双模设计文档，并与「失败代价不对称性」假设对照验证。

## 相关概念

- [[CAP定理]] — AP/CP 取舍的理论基础
- [[分布式问题下沉]] — Nacos 将服务发现从应用代码下沉到基础设施
- [[服务发现]] — 核心功能
