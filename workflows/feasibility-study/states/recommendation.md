# State: Recommendation — Feasibility Verdict & Next Actions

## Purpose
Generate final recommendation (Go/No-Go/Modify/Pivot/Avoid), create HTML dashboard report, and define next actions.
**This is the ONLY state where a final report is generated. All previous phases must be completed first.**

## Interaction Contract
- สร้าง recommendation จากข้อมูลที่เก็บมาทั้งหมด
- สร้าง HTML report → ส่งให้ user download
- ถ้าขาดข้อมูล critical → ห้ามสร้าง report → บอกว่าต้องทำอะไรก่อน

## Report Gate Check

ก่อนสร้าง report ต้องมี:
- ✅ business_type
- ✅ target_customer
- ✅ capital
- ✅ estimated_revenue
- ✅ cost_structure

ถ้าขาด → ระบุว่าขาดอะไร + ทำไมต้องมี + ถาม 1-3 follow-up questions

## Feasibility Score Calculation

Score จาก 5 dimensions (แต่ละ 1-20 คะแนน):

| Dimension | Weight | วัดจากอะไร |
|---|---|---|
| Product/Market Fit | 20 | มีลูกค้าจริงไหม, repeat purchase |
| Unit Economics | 20 | LTV:CAC > 3:1, break-even ≤ 6 เดือน |
| Financial Viability | 20 | runway ≥ 6 เดือน, payback ≤ 12 เดือน |
| Competitive Position | 20 | moat ชัดเจน, กัน copy ได้ไหม |
| Team Capability | 20 | ประสบการณ์, ทรัพยากรพร้อมไหม |

```
Total Score = Sum of (Dimension Score × Weight)
Recommendation = Total Score
```

## Recommendation Thresholds

| Score | Recommendation | ความหมาย |
|---|---|---|
| 80–100 | 🟢 **GO** | ไปต่อได้ ลงทุนได้เลย |
| 60–79 | 🟡 **PILOT FIRST** | ทดลองก่อน ขยายเมื่อพิสูจน์แล้ว |
| 40–59 | 🟠 **MODIFY** | ต้องปรับ business model |
| 20–39 | 🔴 **PIVOT** | ทิศทางผิด คิดใหม่หมด |
| 0–19 | ⚫ **AVOID** | หยุด เลิก ไปต่อไม่ได้ |

## Report Contents

### 1. Executive Summary
```
ธุรกิจ: [business_type]
คะแนนความเป็นไปได้: [score]/100
คำแนะนำ: [GO/PILOT/MODIFY/PIVOT/AVOID]
สรุป: [3-5 บรรทัด]
```

### 2. Business Overview
- ธุรกิจอะไร / ขายอะไร / ให้ใคร
- ทำเล/ช่องทาง

### 3. Market & Competitor
- TAM/SAM/SOM
- Top 3 competitors
- Gap ที่เห็น

### 4. Financial Model (3 Scenarios)
- Best/Base/Worst revenue
- Break-even point
- Runway
- Payback period

### 5. Risk Assessment
- Top 3 failure modes
- SWOT
- Risk heatmap

### 6. Survival Map
- Kill risks
- Early warning signals
- Prevention mechanisms
- Alternative business models

### 7. Final Recommendation
- GO / PILOT / MODIFY / PIVOT / AVOID
- เหตุผล

### 8. Next Actions (3–5 ข้อ)
- ข้อที่ 1: ...
- ข้อที่ 2: ...

## HTML Report Generation

สร้างจาก template: `renderers/dashboard-template.html`

Output files:
- `feasibility_report.html` (บังคับ)
- `feasibility_report.md` (บังคับ)
- `financial_model.csv` (optional)

ส่ง HTML ใน chat ให้ user download ได้เลย

## Obsidian Logging

สร้าง final note ที่:
`~/obsidian-vault/vegapunk/Business/Ventures/<venture>/report.md`

Frontmatter:
```yaml
---
venture: [idea]
phase: recommendation
date: [timestamp]
recommendation: [GO/PILOT/MODIFY/PIVOT/AVOID]
score: [X/100]
---
```

## Resume Logic

ถ้า user พิมพ์ `/bf resume` → อ่าน Obsidian note ล่าสุด → ถามว่าจะ continue หรือเริ่มใหม่

## State Metadata

```yaml
state: recommendation
phase_order: 6
max_turns: 1
questions_per_turn: 0
can_end_early: false
report_available: true
required_outputs: [feasibility_score, recommendation, next_actions, html_report_path, obsidian_note_path]
```