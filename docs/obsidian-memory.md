# Obsidian Memory — Logging & Persistence

## Vault Structure

```
obsidian-vault/
└── vegapunk/
    └── Business/
        └── Ventures/
            └── <venture-name>/
                ├── session.md         # Q&A log (ongoing)
                ├── financial.md       # financial model data
                ├── risks.md           # failure modes + risk heatmap
                ├── research.md         # competitor + market data
                └── report.md          # final recommendation (when complete)
```

## Session Note Frontmatter

```yaml
---
venture: ร้านกาแฟใกล้มหาวิทยาลัย
phase: grill
date: 2025-05-13T14:30:22
session_id: bf_20250513_143022
current_phase: grill
completed_phases: [intake]
tags: [business-feasibility, เจ๊งในกระดาษ, grill]
---

# Session: ร้านกาแฟใกล้มหาวิทยาลัย
```

## Q&A Logging Format

```markdown
### 👤 HERMES [14:30:05]
ฉันจะถามก่อน 5 ข้อที่มีผลต่อความอยู่รอดจริง...

---

### 👤 USER [14:31:20]
ตอบ...

---

**Known Fact:** ...
**Assumption:** ... — marked
**Unknown:** ...
```

## Assumption Marking

```markdown
**Assumption:** customer_acquisition = "ผ่านคนเดิน รพ."
**Why dangerous:** ถ้า conversion ต่ำกว่า 5% → break-even ไม่ถึง
**Validation method:** นับคนเดินผ่าน 1 วัน × estimate conversion
```

## Decision Logging

```markdown
**Decision:** ใช้ capital 500,000 บาท แบ่ง: ค่า装修 200k + เครื่อง 200k + สต็อก 100k
**Reason:** ตามประสบการณ์ที่เคยทำ
**Timestamp:** 2025-05-13T14:33:00
```

## Venture Template

Located at: `obsidian/vault-template/venture-template.md`

Used to initialize new venture notes with correct frontmatter + structure.

## Resume Flow

1. On `/bf resume` or new session:
2. Check for existing notes in `Business/Ventures/`
3. If found → show summary, ask "continue?"
4. If not → create new note from template

## Configuration

```yaml
vault_env: OBSIDIAN_VAULT_PATH  # env var
default_vault: vegapunk
ventures_dir: Business/Ventures
template_subdir: Business/Templates
```

## Logging Rules

- Log EVERY Q&A turn immediately
- Never overwrite previous turns
- Mark assumptions clearly with **Assumption:** prefix
- Use timestamps (HH:MM:SS)
- Separate turns with `---`
- Always update frontmatter phase on state transition