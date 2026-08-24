---
type: entity
title: Spring Cloud
created: 2026-08-24
updated: 2026-08-24
tags: [microservices, java, service-mesh, framework]
related: [凤凰架构, 微服务三关, Nacos, 分布式问题下沉]
sources: ["notes/20260809T155731--深度研究-凤凰架构：构建可靠的大型分布式系统_deep-learn.md"]
---
# Spring Cloud

面向 Java/Spring 应用的综合性微服务框架，提供服务发现、配置管理、熔断和负载均衡。

## 下沉成功案例

Spring Cloud 在 [[深度研究-凤凰架构构建可靠的大型分布式系统deep-learn]] 中被引用为 **H2 的成功案例**：

> "Spring Cloud 下沉服务发现成功了 —— 没人想手写这个。"

在 Spring Cloud 之前，每个应用都需要自定义代码实现服务注册、发现和负载均衡。Spring Cloud 将这些整合为声明式注解和配置，使分布式通信对应用开发者透明。

## 核心组件

| 组件 | 功能 |
|------|------|
| **Spring Cloud Netflix Eureka** | 服务发现与注册（已弃用，转向 Nacos） |
| **Spring Cloud Config** | 集中式配置管理 |
| **Spring Cloud Gateway** | API 网关与路由 |
| **Spring Cloud CircuitBreaker** | Resilience4j 集成实现容错 |
| **Spring Cloud LoadBalancer** | 客户端负载均衡 |
| **Spring Cloud OpenFeign** | 声明式 REST 客户端 |

## 向服务网格的迁移路径

随着 [[服务网格]]（尤其是 Istio）成熟，许多 Spring Cloud 功能变得冗余：
- 服务发现 → 由 K8s DNS + mesh 处理
- 熔断 → 由 mesh 代理处理
- 负载均衡 → 由 mesh 处理
- API 网关 → mesh ingress controller

这是「下沉持续进行」的故事 —— 复杂度继续向栈底层移动。

## 学习计划中的角色

W2 练习引用 Spring Cloud 作为成功下沉服务发现的框架，与 ESB 失败下沉业务编排形成对比。

## 相关概念

- [[分布式问题下沉]] — Spring Cloud 是下沉成功的典范
- [[服务网格]] — 下沉链的下一步
- [[H2]] — Spring Cloud 验证了「没人想管的会被下沉」假设
