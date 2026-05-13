# State: Modeling — Financial Projection & Scenario Analysis

## Purpose
Build 3-scenario financial model (Best/Base/Worst), calculate break-even, runway, and unit economics.
**This phase requires data from intake + grill + research. Run calculations, then present results.**

## Interaction Contract
- คำนวณจากข้อมูลที่มี → แสดงผล → ถาม confirm
- ถ้าขาดข้อมูล → ประมาณจาก benchmark แต่ต้อง mark ชัด
- สร้าง financial model ทั้ง 3 scenarios พร้อมกัน

## Three Scenarios

### Best Case
- Revenue: เท่ากับ target 100%
- Cost: ตามที่วางแผนไว้
- Profit margin: ตาม business plan
- Assumptions ต้องระบุชัด

### Base Case
- Revenue: 70% ของ target
- Cost: +10% จากที่วางแผน
- Profit margin: ลดลงตามสมมุติฐาน

### Worst Case
- Revenue: 40% ของ target
- Cost: +25% จากที่วางแผน
- Profit margin: ติดลบ

## Key Metrics to Calculate

### Break-even Point
```
Break-even (units) = Fixed Cost / Contribution Margin per unit
Break-even (days) = Fixed Cost / Daily Revenue at break-even
Break-even (months) = Fixed Cost / Monthly Contribution Margin
```

### Runway (Months of Survival)
```
Runway = Available Capital / Monthly Net Burn Rate
Monthly Net Burn = Total Monthly Cost − Minimum Revenue (40% of target)
```

### Unit Economics
```
CAC (Customer Acquisition Cost) = Total Sales Cost / Number of New Customers
LTV (Lifetime Value) = Average Order × Purchase Frequency × Customer Lifespan
LTV:CAC Ratio = LTV / CAC  (ต้อง > 3:1 ถึง sustainable)
Contribution Margin = Price − Variable Cost per unit
```

### Payback Period
```
Payback (months) = Initial Investment / Monthly Net Profit (Base Case)
```

## Financial Model Template

```markdown
## Capital: [amount] THB

## Revenue Assumptions
| Scenario | Revenue | Notes |
|---|---|---|
| Best | [100% target] | |
| Base | [70% target] | |
| Worst | [40% target] | |

## Cost Structure
| Item | Monthly | Type |
|---|---|---|
| [cost 1] | [amount] | Fixed |
| [cost 2] | [amount] | Variable |
| ... | ... | ... |

## Key Metrics

| Metric | Value | Notes |
|---|---|---|
| Break-even | [X units/day] | at [price] THB |
| Runway | [X months] | worst case |
| Payback | [X months] | base case |
| LTV:CAC | [X:1] | must be > 3:1 |

## Scenario Summary (Monthly)

| | Best | Base | Worst |
|---|---|---|---|
| Revenue | | | |
| Total Cost | | | |
| Net Profit | | | |
| Cumulative | | | |
```

## Obsidian Logging

Log financial model + assumptions + calculation sources

## Vagued Calculation → Mark Assumption + Use Benchmark

ถ้าขาดข้อมูล:
1. ประมาณจาก benchmark
2. ระบุว่าใช้ assumption อะไร
3. กำหนด metric ที่จะ validate ภายหลัง

## Advance Rules

### Can Advance to Risk?
- ✅ มี financial model ทั้ง 3 scenarios
- ✅ มี break-even point
- ✅ มี runway calculation

### Cannot Advance?
- ยังขาด required fields → บอกว่าต้องหา assumption อะไรก่อน

## State Metadata

```yaml
state: modeling
phase_order: 4
max_turns: 2
questions_per_turn: 2
can_end_early: false
report_available: false
scenarios: [best, base, worst]
required_metrics: [break_even, runway, payback, ltv_cac]
```