---
type: entity
title: etcd
created: 2026-08-24
updated: 2026-08-24
tags: [distributed-systems, consensus, infrastructure, kubernetes]
related: [凤凰架构, Kubernetes, ZooKeeper, Nacos]
sources: ["notes/20260809T155731--深度研究-凤凰架构：构建可靠的大型分布式系统_deep-learn.md"]
---
# etcd

分布式可靠键值存储，作为 Kubernetes 和其他基础设施组件的 backing store。

## Raft 共识实现

etcd 实现 Raft 共识算法，提供一致且可用的分布式 KV 存储。它是 Kubernetes 集群状态 trust root —— 所有 API 对象都持久化在这里。

## 关键特性

- **CP 系统**：优先保证一致性和分区容错性（遵循 [[CAP定理]] 逻辑）
- **Watch 机制**：客户端订阅 key 变更，支持响应式控制器
- **Lease TTL**：自动过期，用于节点和锁
- **Leader 选举**：单一 leader 处理写操作；followers 服务读操作

## 在学习计划中的角色

[[深度研究-凤凰架构构建可靠的大型分布式系统deep-learn]] 将 etcd 作为 W2 动手验证的核心对象：

1. 本地部署 3 节点集群
2. Kill leader → 观察重选举
3. Kill 第二个节点 → 观察多数派约束下的读行为
4. 对比 watch 机制与 ZooKeeper

## 生态位定位

etcd 赢得了「Kubernetes 原生协调」生态位。ZooKeeper 在 Kafka 和更广泛的通用协调场景中仍有价值。二者差异是生态定位，非算法优劣。

## 相关概念

- [[CAP定理]] — etcd 是 CP 设计的典型
- [[reconciliation-loop]] — Kubernetes 控制器监听 etcd 变更并收敛 desired state
- [[Kubernetes]] — etcd 的主要消费者
