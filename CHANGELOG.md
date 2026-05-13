# Changelog

All notable changes to the Business Feasibility Skill framework.

Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [0.1.0] — 2025-05-13

### Added

- **Workflow runtime foundation**
  - State machine engine with 6 phases: intake → grill → research → modeling → risk → recommendation
  - Phase guards and advancement rules
  - Report gate system blocking incomplete reports

- **`/bf` command**
  - Full feasibility study workflow
  - Triggers: `/bf`, `/เจ๊งในกระดาษ`, `/feasibility`
  - Flags: `--deep` (extended research), `--quick` (fast intake), `--html` (generate report)

- **Stateful workflow phases**
  - intake: 5 initial questions, waits for response
  - grill: challenges assumptions, no immediate finalization
  - research: fills gaps with benchmark data
  - modeling: 3-scenario financial model
  - risk: top 3 failure modes identification
  - recommendation: final verdict + HTML report

- **grill-business-model skill**
  - Golden reference skill for consultant interaction
  - 4 question batches with wait behavior
  - High-risk assumption marking with impact statements
  - Vague answer challenge protocol
  - Follow-up loop and escalation logic

- **Obsidian integration**
  - Session notes with frontmatter (venture, phase, session_id, tags)
  - Q&A logging format with timestamps
  - Assumption marking with **Assumption:** prefix
  - Decision logging with timestamp and reason

- **HTML dashboard template**
  - Chart.js bar chart (scenario comparison) and doughnut chart (cost breakdown)
  - KPI cards: feasibility score, break-even, runway, recommendation
  - SWOT section, risk heatmap, failure modes (FDD)
  - Business Model Canvas section
  - Mobile responsive layout and print-friendly CSS

- **Documentation**
  - `docs/workflow-engine.md` — state machine documentation
  - `docs/runtime-state.md` — phase management
  - `docs/obsidian-memory.md` — logging and persistence
  - `docs/html-pipeline.md` — report generation
  - `docs/definition-of-done.md` — v0.1 requirements
  - `docs/error-handling.md` — error handling procedures

- **Examples**
  - `examples/coffee-shop-session.md` — canonical multi-turn workflow example

- **Smoke tests**
  - `tests/smoke-tests.md` — 12 test cases for core behavior

---

## [0.0.0] — 2025-05-13

### Added

- Initial prompt pack
- Basic install.sh
- Basic README