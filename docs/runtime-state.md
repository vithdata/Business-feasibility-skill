# Runtime State — Phase Management

## Session State Object

```yaml
session_id: "bf_20250513_143022"  # auto-generated
business_idea: "ร้านกาแฟใกล้มหาวิทยาลัย"
current_phase: "grill"
venture_path: "~/obsidian-vault/vegapunk/Business/Ventures/coffee-university/"
started_at: "2025-05-13T14:30:22"
updated_at: "2025-05-13T14:35:08"

# Data collected
known_facts:
  - business_type: Specialty coffee
  - target: หมอ/พยาบาล/ผู้ป่วย
  - location: ตึกอำเภอเก่า ใกล้รพ.
  - capital: 500,000 บาท
  - fixed_cost: 32,000/เดือน

assumptions:
  - field: customer_acquisition
    value: "ผ่านคนเดิน รพ."
    risk: "high"
    validated: false

unknowns:
  - field: competitor_pricing
    why_matters: "ไม่รู้ margin จริง"
  - field: repeat_rate
    why_matters: "ไม่รู้ LTV"

risks: []
decisions: []
next_questions:
  - "ถ้ายอดขาย < 30 แก้ว/วัน จะทำอย่างไร?"
  - "ทำไมลูกค้าจะซื้อซ้ำ?"

completed_phases:
  - intake
```

## Phase Flow

```
[intake] ──(has 2+ required)──→ [grill]
[grill] ──(assumptions probed)──→ [research]
[research] ──(benchmark ready)──→ [modeling]
[modeling] ──(scenarios done)──→ [risk]
[risk] ──(risks mapped)──→ [recommendation]
```

## Resume Logic

On `/bf resume`:
1. Find most recent session in Obsidian
2. Parse frontmatter for current_phase
3. Show session summary
4. Ask: "Continue from [phase]?" → yes/no

## State Updates

After each turn:
1. Update known_facts from user response
2. Mark new assumptions
3. Identify new unknowns
4. Compute next_questions based on phase
5. Save to Obsidian

## Phase Completion Rules

| Phase | Done when |
|---|---|
| intake | 2+ required fields, no critical unknowns |
| grill | capital known, cost structure known, no vague criticals |
| research | competitor list + pricing benchmark |
| modeling | 3 scenarios + break-even + runway |
| risk | top 3 failure modes + mitigation plans |
| recommendation | HTML report generated + delivered |

## Error Handling

If user provides contradictory data:
1. Flag the contradiction
2. Ask for clarification
3. Do not advance until resolved

If user refuses to answer:
1. Show impact of missing data
2. Use benchmark assumption if critical
3. Mark as assumption with warning