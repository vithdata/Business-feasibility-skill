# Definition of Done — v0.1 Foundation Release

Minimum requirements for `v0.1.0` to be considered a working feasibility study framework.

---

## Core Workflow

### `/bf` Command

- [ ] `/bf <idea>` starts feasibility-study workflow
- [ ] `/bf resume` resumes from existing session
- [ ] `/bf snapshot` shows current state and progress
- [ ] Command aliases work: `/เจ๊งในกระดาษ`, `/feasibility`

### Workflow Phases

- [ ] `intake` — collects 5 initial questions, waits for response
- [ ] `grill` — challenges assumptions, does NOT finalize
- [ ] `research` — fills gaps with benchmark data
- [ ] `modeling` — builds 3-scenario financial model
- [ ] `risk` — identifies top 3 failure modes
- [ ] `recommendation` — generates final verdict + HTML report

### Phase Rules

- [ ] Phases run in order: intake → grill → research → modeling → risk → recommendation
- [ ] No phase skipping
- [ ] No finalization (SWOT/recommendation) in intake or grill phases
- [ ] Phase completion requires specific data (guards)
- [ ] Report gate blocks incomplete reports

---

## Grill Behavior

- [ ] Asks 4-6 questions per batch
- [ ] Waits for user response before analyzing
- [ ] Challenges vague answers ("น่าจะ", "คง", "ไม่แน่ใจ")
- [ ] Marks high-risk assumptions with impact statement
- [ ] Does NOT produce SWOT or recommendation during grill

---

## State Persistence

- [ ] Session state saved to Obsidian after each turn
- [ ] Session survives interruption (app close, timeout)
- [ ] `/bf resume` restores from Obsidian note
- [ ] Frontmatter tracks: `current_phase`, `session_id`, `venture`
- [ ] Q&A logged with timestamps

---

## Obsidian Integration

- [ ] Notes created in `Business/Ventures/<venture>/session.md`
- [ ] Frontmatter includes: `venture`, `phase`, `date`, `session_id`, `tags`
- [ ] Q&A format uses `### 👤 HERMES [HH:MM:SS]` and `### 👤 USER [HH:MM:SS]`
- [ ] Assumptions marked with `**Assumption:**` prefix
- [ ] Decisions logged with timestamp and reason

---

## HTML Dashboard Report

- [ ] HTML file generated at end of recommendation phase
- [ ] File saved to `reports/feasibility_<session_id>.html`
- [ ] Report attached to chat for download
- [ ] Contains: executive summary, KPI cards, charts, SWOT, risk heatmap
- [ ] Mobile responsive layout
- [ ] Print-friendly CSS

---

## Report Gate

- [ ] Required fields checked before report generation:
  - `business_type`
  - `capital`
  - `fixed_cost`
  - `target_customer`
  - `location`
- [ ] If missing → block with message listing missing fields
- [ ] No report generated with incomplete data

---

## Error Handling

- [ ] Missing vault → graceful message + setup instructions
- [ ] Invalid path → fallback to default path
- [ ] Permission denied → notify user
- [ ] Insufficient data → ask follow-up, block report
- [ ] Report generation failure → error message, no crash
- [ ] Interrupted workflow → state saved, resume works
- [ ] Missing state file → start fresh with warning

---

## Smoke Tests Pass

- [ ] Test 1: Intake asks 4-6 questions, no SWOT
- [ ] Test 2: Grill does not finalize
- [ ] Test 3: Vague answer triggers challenge
- [ ] Test 4: Missing data triggers follow-up, not report
- [ ] Test 5: Resume recovers state correctly
- [ ] Test 6: Assumptions marked with impact
- [ ] Test 7: HTML report generated
- [ ] Test 8: Obsidian logging format correct
- [ ] Test 9: Phase order enforced
- [ ] Test 10: Report gate blocks incomplete reports
- [ ] Test 11: Contradiction detection works
- [ ] Test 12: Max 6 questions per turn enforced

---

## Documentation

- [ ] `docs/workflow-engine.md` — state machine documentation
- [ ] `docs/runtime-state.md` — phase management
- [ ] `docs/obsidian-memory.md` — logging and persistence
- [ ] `docs/html-pipeline.md` — report generation
- [ ] `docs/definition-of-done.md` — this file
- [ ] `docs/error-handling.md` — error handling procedures
- [ ] `examples/coffee-shop-session.md` — canonical example
- [ ] `skills/grill-business-model.md` — golden reference skill

---

## Repository Hygiene

- [ ] `config.example.yaml` — example config, no private data
- [ ] `.gitignore` — prevents private data leaks (config.yaml, .env, reports/, logs/)
- [ ] `CHANGELOG.md` — version history
- [ ] `install.sh` — executable and functional
- [ ] No placeholder TODOs in core workflow files
- [ ] No hardcoded paths (use env vars)

---

## Version Tag

After all checks pass:
```bash
git tag -a v0.1.0 -m "v0.1.0: workflow runtime foundation"
git push origin v0.1.0
```