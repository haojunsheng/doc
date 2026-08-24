---
type: entity
title: ZooKeeper
created: 2026-08-24
updated: 2026-08-24
tags: [distributed-systems, coordination, zookeeper]
related: [凤凰架构, etcd, Kafka, Spring Cloud]
sources: ["notes/20260809T155731--深度研究-凤凰架构：构建可靠的大型分布式系统_deep-learn.md"]
---
# ZooKeeper

基于分层命名空间的分布式协调服务，最初为 Hadoop 构建。提供一致的配置、命名、同步和组服务。

## 核心机制

- **ZNode**：分层键值结构（持久化、临时、顺序）
- **Watcher**：znode 变更的一次性事件通知
- **ZAB 协议**：类 Paxos 的原子广播协议
- **临时节点**：客户端断连后自动删除 → 实现 leader 选举
- **顺序节点**：自增后缀 → 实现分布式锁

## CP 设计

ZooKeeper 是 CP 系统：优先保证一致性和分区容错性。网络分区期间可能不可用，而非服务陈旧数据。

## 典型应用场景

- **Kafka**：broker 协调、topic 配置、消费者组管理
- **Hadoop**：NameNode 高可用、配置管理
- **分布式锁**：临时顺序 znode 实现互斥锁
- **Leader 选举**：临时节点 + 锁模式

## 与 etcd 对比

ZooKeeper vs etcd 之争是生态位竞争，非性能之争：

| 维度 | ZooKeeper | etcd |
|------|-----------|------|
| 数据模型 | 分层 ZNode | 扁平键值 |
| Watch 机制 | 一次性通知 | 长时长 watch |
| 一致性协议 | ZAB（类 Paxos） | Raft |
| 主要生态 | Hadoop/Kafka | Kubernetes |
| TTL 支持 | 临时节点 | 内置 lease API |

## 衰退轨迹

随着 Kubernetes 采用 etcd 以及现代服务网格转向无中心化协调的动态服务发现，ZooKeeper 的使用率下降。它在 Kafka 中仍关键，但在新云原生架构中已不居中。

## 学习计划中的角色

W2 子假设 2.3：「etcd vs ZooKeeper 之争本质是「为 K8s 生态定制」vs「通用协调原语」的生态位之争，不是性能之争。」

## 相关概念

- [[CAP定理]] — ZooKeeper 是典型 CP 系统
- [[分布式问题下沉]] — 协调原语从应用层下沉到基础设施
- [[深度研究-凤凰架构构建可靠的大型分布式系统deep-learn]] — W2 对比练习
