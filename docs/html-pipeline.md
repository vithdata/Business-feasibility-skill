# HTML Pipeline — Report Generation & Rendering

## Overview

The HTML pipeline generates a modern, Chart.js-based dashboard report at the end of the feasibility workflow. The report is attached to the chat for download.

## Pipeline Steps

```
1. Data Collection (from workflow states)
         ↓
2. Template Population (dashboard-template.html)
         ↓
3. Variable Substitution (fill {{placeholders}})
         ↓
4. Chart.js Data Binding
         ↓
5. HTML File Generation
         ↓
6. Attach to Chat (Telegram/CLI)
```

## Template Variables

The `dashboard-template.html` uses Mustache-style placeholders:

### Hero Section
- `{{business_name}}` — business idea
- `{{executive_summary}}` — 3-5 sentence summary
- `{{report_date}}` — ISO timestamp
- `{{location}}` — physical location or "online"
- `{{tags}}` — comma-separated tags

### KPI Cards
- `{{feasibility_score}}` — 0-100 number
- `{{score_color}}` — green/yellow/red based on score
- `{{score_comment}}` — short comment
- `{{break_even}}` — e.g. "40 แก้ว/วัน"
- `{{break_even_note}}` — how calculated
- `{{runway}}` — e.g. "5.2 เดือน"
- `{{runway_color}}` — green/yellow/red
- `{{runway_note}}` — worst case assumption
- `{{recommendation}}` — GO/PILOT/MODIFY/PIVOT/AVOID
- `{{rec_color}}` — color class
- `{{rec_reason}}` — one-line reason

### Chart Data (JavaScript)
- `{{best_rev}}`, `{{base_rev}}`, `{{worst_rev}}` — revenue numbers
- `{{best_cost}}`, `{{base_cost}}`, `{{worst_cost}}` — cost numbers
- `{{best_net}}`, `{{base_net}}`, `{{worst_net}}` — net profit numbers
- `{{cost_labels}}` — JSON array, e.g. ["วัตถุดิบ","ค่าแรง","ค่าเช่า"]
- `{{cost_values}}` — JSON array of percentages

### SWOT
- `{{strengths}}` — HTML `<li>` items
- `{{weaknesses}}` — HTML `<li>` items
- `{{opportunities}}` — HTML `<li>` items
- `{{threats}}` — HTML `<li>` items

### Risk Heatmap
- `{{{risk_rows}}}` — HTML `<tr>` rows with priority classes

### Failure Modes (FDD)
- `{{{fdd_rows}}}` — HTML `<tr>` rows

### Business Model Canvas
- `{{value_proposition}}`
- `{{customer_segment}}`
- `{{revenue_model}}`
- `{{cost_structure}}`
- `{{key_partners}}`
- `{{channels}}`

### Next Actions
- `{{next_actions_count}}` — number
- `{{{next_actions}}}` — HTML `<li>` items

### Assumptions
- `{{assumptions}}` — text list of marked assumptions

## Output Files

| File | Required | Location |
|---|---|---|
| `feasibility_report.html` | Yes | Chat attach + venture folder |
| `feasibility_report.md` | Yes | Venture folder |
| `financial_model.csv` | Optional | Venture folder |

## Report Gate Check

Before generating HTML, verify:
- Required fields present (business_type, capital, etc.)
- If missing → block with message + follow-up questions
- If present → proceed with template population

## Chart.js Integration

The template includes inline Chart.js (CDN) for:
1. **Bar chart** — Scenario comparison (best/base/worst)
2. **Doughnut chart** — Cost structure breakdown

Charts are initialized with inline `<script>` after canvas elements.

## Mobile Responsive

Template includes `@media` breakpoints:
- `900px` → 2-column → 1-column
- `600px` → 4-column → 1-column

## Print Friendly

`@media print` removes shadows and uses white background for clean printing.

## Attachment to Chat

Generated HTML is attached using the media delivery mechanism (e.g., `MEDIA:/path/to/feasibility_report.html` in the response).

## Security

All user-provided data is escaped before insertion into HTML to prevent XSS. Numeric fields are validated as numbers before template population.