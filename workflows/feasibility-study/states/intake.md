# State: Intake — Minimum Business Information Collection

## Purpose
Collect the minimum viable information to begin the feasibility study.
**Never finalize or skip to recommendations during this phase.**

## Interaction Contract
- ถามครั้งละ 5 ข้อ สูงสุด
- รอ response ก่อนถามต่อ
- ถามเฉพาะข้อมูลที่คำนวณไม่ได้ถ้าไม่มี
- ข้อมูล benchmark ได้ → ค้นเอง

## Intake Questions (ใช้ทีละ 5 ข้อ)

### Batch 1 — Core Identity (ถามก่อนเสมอ)
1. **ธุรกิจที่อยากทำคืออะไร?** (ขายอะไร ให้ใคร สรุปสั้นๆ)
2. **ลูกค้ากลุ่มแรกที่จะเป็นลูกค้าคือใคร?** (อายุ/อาชีพ/พฤติกรรม)
3. **ทำเลหรือช่องทางขายอยู่ที่ไหน?** (ถ้ามี physical location)
4. **มีประสบการณ์ในธุรกิจนี้มาก่อนไหม?** (ใช่/ไม่ใช่ + ระดับ 1-5)
5. **เป้าหมายคืออะไร?** (รายได้เสริม / ธุรกิจหลัก / ขยายหลายสาขา)

### Batch 2 — Financial Baseline (ถามถ้ายังไม่ได้)
6. **เงินลงทุนเริ่มต้นที่พร้อมใช้จริงเท่าไหร่?** (ตัวเลขชัด)
7. **ราคาขาย/รายได้ต่อเดือนที่คาดหวังประมาณเท่าไหร่?**
8. **ต้นทุนหลักที่รู้แล้วมีอะไรบ้าง?** (ระบุ min 3 รายการ)
9. **ยอมขาดทุนได้นานกี่เดือน?** (ถ้ายอดขาย = 0)
10. **มีคู่แข่งที่รู้จักแล้วไหม?** (ระบุชื่อ 1-3 ราย)

## Data Classification

| Level | Meaning | Action |
|---|---|---|
| **Known Fact** | User ให้ตัวเลขมา + มีหลักฐาน | ใช้ตรงๆ |
| **Assumption** | ประมาณจาก benchmark ได้ | หาแล้วแจ้ง user |
| **Unknown** | ต้องถาม user | ถามเฉพาะ critical |
| **High-Risk Assumption** | ผิด = เจ๊งแน่ | ต้อง validate ก่อน |

## Advance Rules

### Can Advance to Grill?
- ✅ มี business_type
- ✅ มี target_customer
- ✅ อย่างน้อย 1 ใน: capital หรือ revenue_estimate

### Cannot Advance?
- อธิบายว่าขาดอะไร
- อธิบายว่าทำไมต้องมี
- ถาม follow-up 1-3 ข้อที่ critical ที่สุด
- **ห้าม generate report**

## Obsidian Logging

ทุก Q&A → log ไป `~/obsidian-vault/vegapunk/Business/Ventures/<venture>/session.md`

```markdown
### 👤 HERMES [HH:MM:SS]
[คำถาม]

---

### 👤 USER [HH:MM:SS]
[คำตอบ]

---

**Known Fact:** ...
**Assumption:** ...
**Unknown:** ...
```

## Vagued Response Handling

ถ้า user ตอบ "น่าจะ" / "คิดว่า" / "ไม่แน่ใจ":
1. ถามซ้ำด้วยตัวเลขที่เป็นไปได้ 2 แบบ
2. ถามว่า "ถ้าเลือกระหว่าง A กับ B จะเลือกอะไร"
3. ถ้ายังไม่ตอบ → mark เป็น **Assumption** แล้วใช้ benchmark

## State Metadata

```yaml
state: intake
phase_order: 1
max_turns: 2
questions_this_turn: 5
can_end_early: false
report_available: false
```