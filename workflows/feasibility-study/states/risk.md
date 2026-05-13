# State: Risk — Failure Mode Analysis, SWOT & Risk Heatmap

## Purpose
Identify and map failure modes, assess risks, and create a survival map with prevention/mitigation plans.
**FDD (Failure-Driven Development) approach: "How will this business fail, and how do we prevent it?"**

## Interaction Contract
- ใช้ข้อมูลจาก intake → grill → research → modeling มาวิเคราะห์
- ถามครั้งละ 3 ข้อ ถ้าจำเป็น
- สร้าง failure modes ทั้งหมด → ไม่ต้องถามเยอะ

## Pre-Mortem Exercise (เริ่มจากตรงนี้ก่อน)

ถาม user: "สมมติว่าธุรกิจนี้เจ๊งใน 6 เดือน — ทำไมมันเจ๊ง?"

จากนั้นสร้าง failure modes จากคำตอบ + จาก financial model

## Failure Modes (5–7 modes required)

แต่ละ failure mode ต้องมี:

| Field | คำอธิบาย |
|---|---|
| **Trigger** | อะไรทำให้เกิดการล้มเหลว |
| **Timeline** | กี่เดือน/กี่วันจะเห็นสัญญาณ |
| **Metric** | ติดตามอะไร (KPI ที่จะบอกว่าเริ่มมีปัญหา) |
| **Financial damage** | เสียหายเท่าไหร่ (THB) |
| **Detect** | ตรวจจับอย่างไร — signal อะไร |
| **Prevent** | ป้องกันอย่างไร — design ธุรกิจยังไง |
| **Mitigate** | ถ้าเกิดแล้วทำอย่างไร — action plan |

### Priority Classification

| Priority | เงื่อนไข | Tag |
|---|---|---|
| 🔴 **Critical** | เจ๊งใน 3 เดือน | risk-critical |
| 🟡 **Warning** | เจ๊งใน 6–12 เดือน | risk-warning |
| 🟢 **Monitor** | ติดตางได้ ไม่ต้อง panic | risk-monitor |

## SWOT Analysis

สร้างจากข้อมูลที่รวบรวมได้:

### Strengths (จุดแข็ง)
- สิ่งที่ทำได้ดีกว่าคู่แข่ง
- ข้อได้เปรียบที่ copy ได้ยาก

### Weaknesses (จุดอ่อน)
- สิ่งที่คู่แข่งทำได้ดีกว่า
- ข้อจำกัดที่มีอยู่

### Opportunities (โอกาส)
- Gap ในตลาดที่ยังไม่มีคนทำ
- Trend ที่เอื้อประโยชน์

### Threats (ภัยคุกคาม)
- สิ่งที่อาจทำให้เจ๊ง
- คู่แข่งที่อาจเข้ามา

## Risk Heatmap

สร้าง risk matrix:

| Risk | Probability | Impact | Mitigation |
|---|---|---|---|
| [risk 1] | High/Med/Low | High/Med/Low | [mitigation] |

## Survival Map

แสดง:
1. **Kill Risks** — ถ้าเกิด = เจ๊งแน่
2. **Early Warning Signals** — ติดตามอะไร
3. **Prevention Mechanisms** — ทำอย่างไรไม่ให้เกิด
4. **Business Model Alternatives** — ถ้าต้อง pivot

## Output Template

```markdown
## Failure Modes

### [Mode 1] — 🔴 CRITICAL
- Trigger: ...
- Timeline: ...
- Metric: ...
- Financial damage: ...
- Detect: ...
- Prevent: ...
- Mitigate: ...

### [Mode 2] — 🟡 WARNING
...

## SWOT

### 💪 Strengths
- ...

### ⚠️ Weaknesses
- ...

### 🚀 Opportunities
- ...

### 🚨 Threats
- ...

## Risk Heatmap

| Risk | Prob | Impact | Mitigation |
|---|---|---|---|
| ... | ... | ... | ... |

## Survival Map
- Kill Risk #1: ...
- Early Warning: ...
- Prevention: ...
```

## Obsidian Logging

บันทึก failure modes + SWOT + risk heatmap + sources

## Advance Rules

### Can Advance to Recommendation?
- ✅ มี top 3 failure modes พร้อม prevention
- ✅ มี SWOT ครบ 4 ด้าน
- ✅ มี risk heatmap

### Cannot Advance?
- ยังขาด → ใช้ benchmark ก่อนถ้าจำเป็น

## State Metadata

```yaml
state: risk
phase_order: 5
max_turns: 2
questions_per_turn: 3
can_end_early: false
report_available: false
required_outputs: [fdd_modes, swot, risk_heatmap, survival_map]
```