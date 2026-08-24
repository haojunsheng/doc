---
type: entity
title: MySQL
created: 2026-08-24
updated: 2026-08-24
tags: [mysql, rdbms, innodb, mvcc]
related: [innodb, 快照读vs当前读, b树有序性与索引失效, next-key锁与加锁规则, 双1配置与crash-safe, 并行复制两条铁律]
sources: ["notes/20260809T154709--深度研究-MySQL实战45讲_deep-learn.md"]
---

# MySQL

关系型数据库管理系统，本学习计划的核心研究对象。

## 实验双版本

| 版本 | 用途 | 备注 |
|:---|:---|:---|
| MySQL 5.7 | 复现课程原始实验 | 课程基于 ≤5.7.24 总结机制 |
| MySQL 8.0 | 验证新行为差异 | 部分行为（data_locks、并行复制策略）有差异，差异本身是学习素材 |

## 核心机制域

- **InnoDB 引擎**：MVCC、redo log/binlog、B+ 树索引、next-key lock 的载体
- **Server 层**：连接器、查询缓存、分析器、优化器、执行器
- **复制协议**：binlog 三种格式（statement/row/mixed）、组提交、GTID
- **高可用方案**：异步复制、半同步、MHA、MGR

## 关键版本行为差异

课程中部分机制总结基于旧版本，8.0 存在行为变更：
- `performance_schema.data_locks` 提供可观测的锁范围
- 并行复制策略（writeset vs LOGICAL_CLOCK）实现路径不同
- 这些差异应作为学习素材而非矛盾记录