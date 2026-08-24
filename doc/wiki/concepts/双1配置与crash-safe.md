---
type: concept
title: 双 1 配置与 crash-safe
created: 2026-08-24
updated: 2026-08-24
tags: [mysql, innodb, redo log, binlog, crash-safe, 双1配置]
related: [mysql, 并行复制两条铁律, 假设驱动学习计划-h1h2h3h4可证伪框架]
sources: ["notes/20260809T154709--深度研究-MySQL实战45讲_deep-learn.md"]
---

# 双 1 配置与 crash-safe

W5 核心：`innodb_flush_log_at_trx_commit=1` + `sync_binlog=1` 是 crash-safe（RPO=0）的充分非必要条件，但带来明显的 TPS 性能代价。

## 双参数含义

| 参数 | 值 | 作用 | 代价 |
|:---|:---|:---|:---|
| `innodb_flush_log_at_trx_commit` | 1 | 每次事务提交时 flush redo log 到磁盘 | 每次提交都有 fsync，性能最低 |
| `sync_binlog` | 1 | 每次事务提交时 sync binlog 到磁盘 | 主从一致性最优，但写入放大 |

## 其他配置对比

| innodb_flush_log_at_trx_commit | sync_binlog | crash-safe | TPS 表现 | RPO |
|:---|:---|:---|:---|:---|
| 1 | 1 | 双 1 配置 | 最低 | 0 |
| 1 | 0 | 部分 safe | 中等 | 0-1 秒 |
| 0 | 1 | 部分 safe | 中等 | 0-1 秒 |
| 0 | 0 | 不安全 | 最高 | 最多 1 秒数据丢失 |

## 验证实验

使用 sysbench 对比双 1 与非双 1 配置的 TPS：
```bash
sysbench oltp_read_write --tables=10 --table-size=1000000 --threads=16 run
```

双 1 配置的 TPS 明显低于非双 1，这是安全与性能的 trade-off。

## 两阶段提交的作用

redo log（引擎层）+ binlog（Server 层）的两阶段提交，防止的是"事务部分提交后 crash 导致数据不一致"的事故：
- 仅 redo log commit：引擎层数据持久化，但 binlog 未落盘，主从可能不一致
- 仅 binlog commit：Server 层记录完整，但引擎层数据未刷盘，崩溃后恢复不完整

两阶段提交（prepare → commit）确保两者原子性。

## 对话验收

Q："为什么需要两个日志？"
- 必须答出 redo log 是引擎层的、binlog 是 Server 层的——为什么要两个，两阶段提交防的是什么事故

Q："双 1 配置是必须的么？"
- 必须答出"充分非必要"，能说明业务场景下的取舍坐标