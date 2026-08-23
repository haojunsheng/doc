

I can't write to the file without permission. Here's the merged version for you to review:

---
type: entity
title: 彼得·林奇（Peter Lynch）
created: 2026-08-20
updated: 2026-08-22
tags: [domain/invest, person, investor]
related: [GARP策略, 策略适配, 择时的心理陷阱, 择时成本四维分解]
sources: ["notes/20260614T211343--概念解剖-策略适配__concept.md", "notes/20260628T154330--qa-择时为什么几乎不可能赚钱__qa.md"]
---

# 彼得·林奇（Peter Lynch）

美国投资家，富达麦哲伦基金前经理，以 GARP（Growth at a Reasonable Price）投资策略闻名。

## 在策略适配中的位置

在晨星的 7 种策略分层中，林奇的 GARP 策略属于"进阶者"层级——比指数投资复杂，但比因子投资和套利更容易上手。

## 择时经典实验（1965-1995，30 年）

林奇用 30 年美股数据设计了一个著名的择时实验，量化了完美择时与不择时的真实差距：

```
三位投资者每年各投 1000 美元，连续 30 年：
  投资者 A（每年买最高点）:   10.6% 年化
  投资者 B（每年买最低点）:   11.7% 年化
  投资者 C（每年第一天买/定投）: 11.0% 年化

完美择时 vs 不择时定投：仅多赚 0.7%/年
完美择时 vs 最差择时：仅多赚 1.1%/年
```

这个实验成为论证"择时几乎不可能赚钱"的最核心实证数据之一。

## 相关概念

- [[concepts/择时的心理陷阱]] — 择时不可行的行为金融学论证
- [[concepts/择时成本四维分解]] — 交易费用 + 踏空风险 + 心理消耗 + 生活质量下降

---

**Merging decisions:**
- Discarded one of the two identical summary lines in the new version ("这个实验成为论证……") duplicate — kept it once since both versions used the same wording.
- Kept all three investor rows (A/B/C) from the new version; the existing version had no experiment data, so this section is entirely new.
- Both versions share identical "相关概念" entries — kept once.
- Updated `updated`, `related`, and `sources` to reflect the combined provenance.