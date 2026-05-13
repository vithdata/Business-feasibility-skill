# Business Feasibility Skill — Smoke Tests

Smoke tests verify the core workflow behavior without running a full LLM.
These test the **interaction contract** — ask, wait, challenge, persist.

---

## Test 1: Intake Ask Behavior

**Test:** `bf ร้านกาแฟ specialty ใกล้โรงพยาบาล`

**Expected:**
- [ ] System asks 4-6 questions in first turn
- [ ] System does NOT generate SWOT or recommendation
- [ ] System does NOT generate final report
- [ ] System waits for user response
- [ ] `current_phase = intake`

**Invalid behavior:**
- Immediate SWOT output
- "คุณน่าจะมี strengths คือ..."
- "แนะนำให้ทำ X, Y, Z..."

---

## Test 2: Grill — No Immediate Finalization

**Test:** After intake response, system enters GRILL phase

**Expected:**
- [ ] GRILL asks 4 questions per batch
- [ ] System marks high-risk assumptions
- [ ] System challenges vague answers
- [ ] System does NOT produce recommendation in GRILL phase
- [ ] System logs Q&A to Obsidian

**Invalid behavior:**
- "นี่คือ SWOT analysis ของร้านกาแฟของคุณ..."
- "แนะนำให้ทำ X, Y, Z เพราะ..."
- Skipping to recommendation phase

---

## Test 3: Vague Answer Challenge

**Test:** User says "น่าจะได้ลูกค้าเยอะ"

**Expected:**
- [ ] System asks: "เยอะ คือกี่คน? ช่องทางไหน? ทำไมถึงมาหาเรา?"
- [ ] System does NOT accept the vague answer
- [ ] System waits for concrete numbers

---

## Test 4: Missing Critical Data — Report Gate

**Test:** User provides incomplete data (no capital, no cost)

**Expected:**
- [ ] System identifies missing critical fields
- [ ] System asks follow-up questions
- [ ] System does NOT generate report
- [ ] System blocks report_gate until data present

**Invalid behavior:**
- Generating report with missing data
- Accepting "ไม่รู้" as final answer for capital

---

## Test 5: State Persistence — Resume Workflow

**Test:** `/bf resume` after interrupted session

**Expected:**
- [ ] System finds existing Obsidian note
- [ ] System shows session summary
- [ ] System asks: "Continue from [phase]?"
- [ ] System resumes from correct phase

**Invalid behavior:**
- Starting new session without checking existing notes
- Losing previously collected data

---

## Test 6: Assumption Marking

**Test:** User says "คุณภาพดีกว่า"

**Expected:**
- [ ] System marks as assumption: `**[Assumption Marked]** → คุณภาพดีกว่า`
- [ ] System states impact: "ถ้าผิด → [ผลกระทบ]"
- [ ] System proposes validation method

---

## Test 7: HTML Report Generation

**Test:** Workflow completes all phases

**Expected:**
- [ ] HTML file created at `reports/feasibility_<session_id>.html`
- [ ] Contains: executive summary, KPI cards, charts, SWOT, risk heatmap
- [ ] Mobile responsive layout
- [ ] Report attached to chat

**Invalid behavior:**
- No HTML output after recommendation phase
- Broken/malformed HTML file

---

## Test 8: Obsidian Logging

**Test:** After each Q&A turn

**Expected:**
- [ ] New session note created in `Business/Ventures/<venture>/session.md`
- [ ] Frontmatter updated: `current_phase`, `completed_phases`, `session_id`
- [ ] Q&A logged with timestamps
- [ ] Assumptions marked with `**Assumption:**` prefix

**Invalid behavior:**
- Overwriting previous turns
- No frontmatter updates
- Missing timestamps

---

## Test 9: Phase Progression Order

**Test:** Full workflow from start to report

**Expected order:**
```
[intake] → [grill] → [research] → [modeling] → [risk] → [recommendation]
```

**Invalid:**
- `intake` → `recommendation` (skipping phases)
- `grill` → `intake` (going backwards)

---

## Test 10: Report Gate Blocking

**Test:** Attempt to generate report with incomplete data

**Expected:**
- [ ] Report gate checks required fields: `business_type`, `capital`, `fixed_cost`, `target_customer`, `location`
- [ ] If any critical field missing → block with message
- [ ] Message explains what data is missing and why it matters

---

## Test 11: Contradiction Detection

**Test:** User provides data that contradicts earlier response

**Expected:**
- [ ] System detects: "ก่อนหน้าบอก [A] แต่ตอนนี้บอก [B] → อันไหนถูก?"
- [ ] System does NOT advance until resolved
- [ ] System logs contradiction

---

## Test 12: Max Questions Per Turn

**Test:** Check `max_questions_per_turn = 6` enforcement

**Expected:**
- [ ] Intake asks 5 questions (within limit)
- [ ] GRILL asks 4 questions per batch (within limit)
- [ ] System does NOT dump all questions at once

---

## Running Smoke Tests

These tests describe expected behavior. To validate manually:

1. Start new session: `/bf ร้านกาแฟ specialty ใกล้โรงพยาบาล`
2. Observe first response — should ask 5 questions, not SWOT
3. Provide vague answers — observe challenge behavior
4. Interrupt session, resume — observe state recovery
5. Complete workflow — verify HTML report generated
6. Check Obsidian — verify logging format

---

## Validation Checklist

- [ ] bf command triggers feasibility-study workflow
- [ ] Intake asks 4-6 questions, waits
- [ ] GRILL does not finalize
- [ ] Assumptions are marked with impact
- [ ] State persists in Obsidian
- [ ] Resume works correctly
- [ ] Report gate blocks incomplete reports
- [ ] HTML dashboard generates at end
- [ ] All phases run in order