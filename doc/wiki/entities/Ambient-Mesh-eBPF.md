---
type: entity
title: Ambient Mesh / eBPF
created: 2026-08-24
updated: 2026-08-24
tags: [service-mesh, ebpf, kubernetes, observability, performance]
related: [凤凰架构, Istio, 服务网格, reconciliation-loop]
sources: ["notes/20260809T155731--深度研究-凤凰架构：构建可靠的大型分布式系统_deep-learn.md"]
---
# Ambient Mesh / eBPF

下一代服务网格方案，通过节点级环境代理或内核级 eBPF 程序消除 per-pod sidecar。

## Sidecar 问题

传统服务网格（带 Envoy sidecar 的 Istio）引入显著开销：
- **资源翻倍**：每个 pod 需要代理容器
- **调试复杂**：流量经过不可见代理
- **运维负担**：代理配置与应用配置并行管理
- **延迟增加**：每次请求额外网络跳数

## Ambient Mesh 方案

Ambient mesh（由 Istio 的 ambient mode 和 Cilium Service Mesh 等项目推广）完全移除 sidecar：

- **Waypoint 代理**：命名空间/pod 组级别的共享代理，而非 per-pod
- **透明代理**：网络策略将流量导向 waypoint，应用无感知
- **降低开销**：相比 per-pod sidecar 显著节省资源

## eBPF 方案

eBPF（extended Berkeley Packet Filter）将下沉推向更深处——进入 Linux 内核本身：

| 层级 | Sidecar | Ambient | eBPF |
|------|---------|---------|------|
| 部署位置 | Per-pod 容器 | Per-namespace 代理 | 内核模块 |
| 资源开销 | 高 | 中 | 低 |
| 可见性 | 应用级 | 网络级 | 内核级 |
| 复杂度 | 高 | 中 | 低（从应用视角） |
| 调试难度 | 难 | 较易 | 最难（内核级） |

eBPF 允许可观测性、流量管理和安全策略，无需任何应用代码更改或 sidecar 容器。

## 与 H2 的关系

Ambient mesh 和 eBPF 代表 **「下沉后的再优化」**——不是倒退：

> "这是下沉之后的再下沉，把代理推向更深的 infra 栈（节点级 → 内核级）。"

复杂度没有移回应用层，而是移到了比之前更低的层级。这验证了 [[H2]] 而非反驳它。

## 相关概念

- [[服务网格]] — ambient mesh 是传统 sidecar 网格的演进
- [[下沉意愿判据]] — 判据解释了为什么 eBPF 可能 succeed 而 sidecars struggle
- [[Kubernetes]] — ambient mesh 和 eBPF 是 K8s 原生方案
- [[reconciliation-loop]] — K8s 控制器以类似 sidecar 的方式管理 ambient mesh 资源
