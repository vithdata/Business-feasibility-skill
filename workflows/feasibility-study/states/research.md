# State: Research — Market Benchmark & Competitor Analysis

## Purpose
Research market data, benchmarks, and competitor information to fill gaps and validate assumptions.
**This phase runs AFTER intake + grill. Do NOT skip to this phase without data from previous phases.**

## Interaction Contract
- ระบบค้นข้อมูลเอง → ถามเพิ่มเฉพาะที่ยังขาด
- ถามครั้งละ 3 ข้อ สูงสุด
- ใช้ public data, benchmark, และ public sources
- บันทึก sources ทุกครั้ง

## Research Areas

### 1. Market Overview
- TAM / SAM / SOM ของตลาดนี้ในไทย
- Growth rate (CAGR)
- Key trends ปีนี้ vs ปีที่แล้ว
- Seasonality (มี high season ไหม)

### 2. Competitor Analysis
- คู่แข่ง 5 รายแรก (ชื่อ, ราคา, จำนวนสาขา)
- ส่วนแบ่งตลาดโดยประมาณ
- Strengths และ weaknesses ของแต่ละราย
- Gap ในตลาดที่ยังไม่มีคนทำ

### 3. Pricing Benchmark
- ราคาเฉลี่ยของตลาด
- ราคาต่ำสุด / สูงสุด
- ลูกค้ายินดีจ่ายเท่าไหร่ (WTP)
- Price sensitivity ในตลาดนี้

### 4. Customer Behavior
- Decision journey ของลูกค้า
- Pain points หลัก
- Buying frequency
- ช่องทางที่ลูกค้าหาข้อมูลก่อนซื้อ

## Research Output Template

```markdown
## Market Summary
- TAM: ...
- Growth: ...
- Trend: ...

## Competitors
| ชื่อ | ราคา | ส่วนแบ่ง | Strength | Weakness |
|---|---|---|---|---|
| ... | ... | ... | ... | ... |

## Gap ที่เห็น
...

## Benchmark Pricing
- Average: ...
- Range: ...
- WTP: ...
```

## Questions to Ask (ถ้าขาด)

1. **ทำเลที่จะเปิด — มีคู่แข่งอะไรบ้างในรัศมี 1 กม.?**
2. **ราคาขายที่คิดไว้ เทียบกับตลาดแพงไหม ถูกไหม?**
3. **ลูกค้าเป้าหมายพฤติกรรมเป็นแบบไหน?** (อายุ/รายได้/ความถี่ซื้อ)

## Vagued Data → Mark as Assumption

ถ้าหาไม่ได้ → ระบุว่า "สมมติฐาน" พร้อม source ที่อิง

## Obsidian Logging

```markdown
## Research Findings
[summarize]

**Sources:**
- [url/source 1]
- [url/source 2]

**Assumptions:**
- [assumption] — based on [source/none]
```

## Advance Rules

### Can Advance to Modeling?
- ✅ มี competitor list
- ✅ มี market size estimate
- ✅ มี pricing benchmark

### Cannot Advance?
- บอกว่าขาดข้อมูลอะไร
- ใช้ "ประมาณ" ก่อนถ้าจำเป็น แต่ต้อง mark ชัด

## State Metadata

```yaml
state: research
phase_order: 3
max_turns: 2
questions_per_turn: 3
can_end_early: false
report_available: false
research_areas: [market_overview, competitor_analysis, pricing_benchmark, customer_behavior]
```