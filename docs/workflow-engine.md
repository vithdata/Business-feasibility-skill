# Workflow Engine — State Machine Documentation

## Overview

The Hermes Business Feasibility Framework uses a **state machine workflow engine** to run multi-turn consulting sessions. Unlike a chatbot that answers immediately, this system enforces a strict phase-by-phase progression with memory persistence.

---

## Core Concepts

### State Machine
A workflow consists of **states** (phases) connected by **transitions**. A session cannot skip states — it must pass through each phase sequentially.

```
intake → grill → research → modeling → risk → recommendation
```

### State
Each state has:
- `id` — unique identifier
- `max_turns` — maximum back-and-forth turns allowed
- `questions_per_turn` — how many questions to ask at once
- `required_fields` — data must be collected before advancing
- `next_phase` — which state comes after this one
- `advance_condition` — rule for when state is considered complete

### Transition
A transition is blocked by **guards** until conditions are satisfied. If guards fail, the workflow pauses and asks for missing data.

### Session
A session tracks:
- Current state
- Known facts collected
- Assumptions marked
- Questions remaining
- Obsidian note path

---

## State Definitions

### 1. INTAKE
**Purpose:** Collect minimum viable business information

Questions per turn: 5
Max turns: 2

Focus: business type, target customer, capital, revenue estimate

Advance when: at least 2 required fields filled

### 2. GRILL
**Purpose:** Challenge assumptions deeply

Questions per turn: 4
Max turns: 4

Focus: financial structure, traffic/conversion, operations, competitive advantage

Advance when: critical assumptions uncovered, no vague critical answers

### 3. RESEARCH
**Purpose:** Fill gaps with benchmark/market data

Questions per turn: 3
Max turns: 2

Focus: competitors, pricing benchmarks, market size, customer behavior

Advance when: benchmark data collected

### 4. MODELING
**Purpose:** Build 3-scenario financial model

Questions per turn: 2
Max turns: 2

Focus: best/base/worst scenarios, break-even, runway, LTV:CAC

Advance when: all 3 scenarios calculated

### 5. RISK
**Purpose:** Identify failure modes and create risk heatmap

Questions per turn: 3
Max turns: 2

Focus: FDD failure modes, SWOT, survival map

Advance when: top 3 risks identified with prevention plans

### 6. RECOMMENDATION
**Purpose:** Generate final verdict and HTML report

Questions per turn: 0
Max turns: 1

Output: feasibility score, recommendation, HTML dashboard, next actions

---

## Guards

Guards are conditions that block state advancement until satisfied.

### required_fields.yaml
Lists critical/important fields per state. If missing, workflow cannot advance.

### can_advance.yaml
Defines per-state advancement rules with fail messages.

### report_gate.yaml
Blocks report generation until all critical data is present.

---

## Interaction Contract

The interaction contract enforces consultant behavior:

1. **Ask small batches** — never dump all questions at once
2. **Wait for response** — never advance without user input
3. **Never finalize immediately** — don't give recommendations in intake/grill
4. **Challenge assumptions** — if vague, push until numbers are real
5. **Phase by phase** — don't skip states
6. **Consultant tone** — be direct, don't sugarcoat

---

## Workflow Execution

### Starting a Workflow
```bash
/bf ร้านกาแฟใกล้มหาวิทยาลัย
```

### Phase Progression
1. intake — collect 5 core questions → user responds
2. analyze response → mark known facts / assumptions
3. if can advance → move to grill, else ask follow-up
4. repeat until all phases complete
5. recommendation → generate HTML report

### Blocking
If guards block advancement, the system:
1. Shows what data is missing
2. Explains why each piece matters
3. Asks 1-3 follow-up questions
4. Waits for response

---

## Session Persistence

Sessions persist via Obsidian notes. On resume:

1. Read last session note
2. Identify current_phase from frontmatter
3. Show what is known vs unknown
4. Ask: continue or start fresh?

---

## Observability

Each phase logs to Obsidian with:
- Phase name and timestamp
- Questions asked
- User responses
- Marked assumptions
- Decisions made
- Next actions