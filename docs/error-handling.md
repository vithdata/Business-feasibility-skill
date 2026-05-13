# Error Handling — v0.1 Foundation Release

Error scenarios and their recovery behaviors.

---

## Missing Vault

**Symptom:** Obsidian vault path does not exist

**Detection:**
```python
if not os.path.exists(vault_path):
    raise VaultNotFoundError(f"Vault not found: {vault_path}")
```

**User-facing behavior:**
```
⚠️ ไม่พบ Obsidian vault
vault: vegapunk
path: ~/Documents/vegapunk

→ ใช้ `/bf setup` เพื่อสร้าง vault ใหม่
→ หรือตั้ง OBSIDIAN_VAULT_PATH เป็น path ที่ถูกต้อง
```

**Recovery:** Prompt user to run `/bf setup` or set env var

---

## Invalid Path

**Symptom:** Path exists but is not accessible (permissions)

**User-facing behavior:**
```
⚠️ ไม่สามารถเข้าถึง path นี้ได้
path: ~/Documents/vegapunk/Business
permission: denied

→ ตรวจสอบว่า path ถูกต้องและมีสิทธิ์อ่าน/เขียน
```

**Recovery:** Fall back to default vault path, notify user

---

## Permission Denied

**Symptom:** Cannot create/write files in venture directory

**User-facing behavior:**
```
⚠️ ไม่สามารถเขียนไฟล์ได้
path: Business/Ventures/coffee-shop/
error: permission denied

→ ตรวจสอบสิทธิ์ของโฟลเดอร์
```

**Recovery:** Stop workflow, prompt user to fix permissions

---

## Insufficient Data (Report Gate)

**Symptom:** Missing required fields when attempting to generate report

**Required fields:** `business_type`, `capital`, `fixed_cost`, `target_customer`, `location`

**User-facing behavior:**
```
🚫 Report Gate: ข้อมูลไม่ครบ

ขาด:
• capital — ยังไม่ทราบงบลงทุน
• fixed_cost — ยังไม่ทราบค่าใช้จ่ายประจำ

→ ตอบคำถามเหล่านี้ก่อน → ระบบจะสร้าง report ให้อัตโนมัติ
```

**Recovery:** Block report generation, ask missing questions

---

## Report Generation Failure

**Symptom:** Template population or file write fails

**User-facing behavior:**
```
⚠️ ไม่สามารถสร้าง HTML report ได้
error: [specific error]

→ ลองใหม่อีกครั้ง หรือติดต่อผู้ดูแลระบบ
→ session ของคุณยังคงอยู่ — resume ได้ทุกเมื่อ
```

**Recovery:**
1. Log error to session note
2. Notify user
3. Preserve session state for resume

---

## Interrupted Workflow

**Symptom:** User sends interrupt signal or session times out mid-phase

**User-facing behavior on resume:**
```
📋 Session ถูก interrupt เมื่อ [timestamp]

สิ่งที่รู้แล้ว:
• ธุรกิจ: ร้านกาแฟ specialty ใกล้ รพ.
• Capital: 500,000 บาท
• Fixed cost: 32,000/เดือน

ขั้นตอนสุดท้าย: grill (batch 2/4)

→ พิมพ์ "ต่อ" เพื่อresume จากจุดนี้
→ หรือ "เริ่มใหม่" เพื่อล้างข้อมูล
```

**Recovery:**
1. Save state to Obsidian before timeout
2. On resume, load state and continue
3. Never lose data mid-turn

---

## Missing State

**Symptom:** Attempt to resume but no session found

**User-facing behavior:**
```
📋 ไม่พบ session ที่ค้างอยู่

→ เริ่ม session ใหม่ด้วย /bf <ธุรกิจของคุณ>
→ หรือ /bf setup เพื่อตั้งค่า vault
```

**Recovery:** Start fresh, no data loss

---

## Broken HTML Output

**Symptom:** HTML file created but malformed

**Detection:**
```python
try:
    with open(html_path, 'r') as f:
        content = f.read()
    # Check for required sections
    assert 'feasibility_report' in content
    assert 'executive_summary' in content
except:
    raise HTMLGenerationError("Malformed HTML output")
```

**User-facing behavior:**
```
⚠️ HTML report เสียหาย — ไม่สามารถส่งให้คุณได้

→ ลองใหม่อีกครั้ง: /bf resume แล้วทำ phase สุดท้าย
→ session ของคุณยังคงอยู่ใน Obsidian
```

**Recovery:** Delete broken file, allow retry, preserve session

---

## Vague Answer Loop

**Symptom:** User repeatedly gives vague answers

**User-facing behavior (after 2nd vague answer):**
```
⚠️ คำตอบยังไม่ชัดเจน

ฉันต้องการตัวเลขจริงเพื่อคำนวณ feasibility
"น่าจะ" หรือ "คง" ไม่เพียงพอ

ตัวอย่างที่ดี:
• "ลูกค้าวันแรก 20-30 คน"
• "งบลงทุน 500,000 บาท แบ่งเป็น: ค่า装修 200k + เครื่อง 200k"

ถ้ายังไม่แน่ใจ → บอกว่า "ไม่แน่ใจ" แล้วฉันจะหา benchmark ให้
```

**Recovery:** Prompt for concrete numbers or explicit uncertainty

---

## Contradiction Detection

**Symptom:** New data contradicts earlier statement

**User-facing behavior:**
```
⚠️ Contradiction detected

ก่อนหน้า: "fixed_cost = 25,000/เดือน"
ตอนนี้: "fixed_cost = 40,000/เดือน"

อันไหนถูก? ฉันจะใช้ค่าใหม่แต่ต้องการยืนยัน
```

**Recovery:** Pause, ask for clarification, log contradiction

---

## Obsidian Write Failure

**Symptom:** Cannot write to Obsidian note

**User-facing behavior:**
```
⚠️ ไม่สามารถบันทึกลง Obsidian ได้

path: Business/Ventures/coffee-shop/session.md
error: disk full / permission denied

⚠️ Warning: session จะไม่ถูกบันทึกถ้าหยุดตรงนี้

→ พิมพ์ "บันทึก local" เพื่อบันทึกไว้ชั่วคราว
→ หรือ "หยุด" เพื่อจบ session (ข้อมูลจะสูญหาย)
```

**Recovery:** Offer local backup, do not proceed without save

---

## Error Recovery Priority

1. **Never lose session data** — always save before error
2. **Notify user clearly** — Thai language, specific problem
3. **Offer actionable next step** — not just error code
4. **Preserve workflow state** — resume must work
5. **Log error for debugging** — timestamp + context

---

## Fallback Behavior Summary

| Error | Fallback | User Message |
|---|---|---|
| Missing vault | Prompt setup | ตั้งค่า vault ก่อน |
| Invalid path | Default vault | ใช้ default path |
| Permission denied | Stop + notify | ตรวจสอบสิทธิ์ |
| Insufficient data | Block report | ตอบคำถามก่อน |
| Report generation fail | Preserve session | ลองใหม่ได้ |
| Interrupted workflow | Save state | resume ได้ |
| Missing state | Start fresh | ไม่พบ session เก่า |
| Broken HTML | Delete + retry | ลองใหม่อีกครั้ง |