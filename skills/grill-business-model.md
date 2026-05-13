# Grill Business Model — Golden Reference Skill

## Purpose

ซักแผนธุรกิจให้ลึก — ค้นหา assumptions ที่อันตรายที่สุดก่อนลงทุนจริง
**เป้าหมาย: หา 3 assumptions ที่อันตรายที่สุด ก่อนที่ user จะลงทุนเงินจริง**

## Interaction Contract

### หลักการสำคัญ

1. **ถาม batch เล็ก** — สูงสุด 4-6 ข้อ ต่อ turn
2. **รอ response** — ห้ามวิเคราะห์หรือถามต่อ ก่อนได้คำตอบ
3. **ห้าม finalize** — ห้ามสร้าง SWOT หรือ recommendation ในช่วง grill
4. **Challenge vague** — ถ้าคำตอบเป็น "น่าจะ", "คง", "นึกไม่ออก" → ผลักจนได้ตัวเลขจริง
5. **Mark assumptions** — ทุก assumption ต้องถูก mark ชัดเจนพร้อม impact
6. **Phase-by-phase** — ห้าม skip intake → ข้ามไป recommendation

### Stop Conditions

หยุดถามและไป phase ถัดไปเมื่อ:
- รู้ capital, rough cost structure, differentiation ชัดเจน
- ไม่มี "น่าจะ" ในคำตอบที่ critical
- มี 3 high-risk assumptions ที่ marked แล้ว
- user ตอบครบ batch หรือบอกว่ายังไม่พร้อมตอบ

### Stop Conditions ที่ห้ามไปต่อ

- ยังไม่รู้ capital
- ยังไม่รู้ rough cost
- มีคำตอบเป็น assumption ที่ยังไม่ mark
- คำตอบผิดกับข้อมูลที่บอกไว้ก่อนหน้า (contradiction)

---

## Intake Loop

### เมื่อ user พิมพ์ `/bf <idea>`

```
1. สร้าง session ID
2. สร้าง Obsidian note
3. ถาม 5 ข้อ (ดูด้านล่าง)
4. รอ response
5. Mark known facts / assumptions
6. วิเคราะห์ → ถ้า critical unknown → ถาม follow-up 1-3 ข้อ
7. ถ้าไม่ critical → ไป GRILL phase
```

### Intake Batch — 5 ข้อ

```
1. ธุรกิจคืออะไร? (ขายอะไร ให้ใคร สรุปสั้นๆ)

2. ลูกค้ากลุ่มแรกที่จะเป็นลูกค้าคือใคร?
   → อายุ / อาชีพ / พฤติกรรม

3. ทำเลอยู่ที่ไหน? (ถ้ามี location แน่นอนแล้ว)

4. มีประสบการณ์ในธุรกิจนี้ไหม?
   → ใช่/ไม่ + ระดับ 1-5

5. เป้าหมายคืออะไร?
   → รายได้เสริม / ธุรกิจหลัก / ขยายหลายสาขา
```

### ถ้า user พิมพ์แค่ `/grill` โดยไม่มี idea

```
→ ใช้ business idea จาก session ก่อนหน้า (ถ้ามี)
→ ถ้าไม่มี → ถาม: "อยาก grill ธุรกิจอะไร?"
```

### Intake Follow-up Loop

หลัง response แรก:
- วิเคราะห์คำตอบ → หา critical unknowns
- ถาม follow-up 1-3 ข้อ เฉพาะที่มีผลต่อ feasibility
- ห้ามถามเกิน 3 ข้อต่อ follow-up
- ถ้าไม่มี critical unknown → ไป GRILL

---

## GRILL Phase

### GRILL Batch 1 — Financial Foundation (4 ข้อ)

```
1. งบลงทุน [X] บาท แบ่งเป็นอะไรบ้าง?
   → ระบุรายการ: [ ] / [ ] / [ ]

2. Fixed cost ต่อเดือนเท่าไหร่?
   → ค่าเช่า + เงินเดือน + ค่าน้ำไฟ + ...

3. Margin ต่อหน่วยเท่าไหร่?
   → ราคาขาย [ ] − ต้นทุน [ ] = [ ] บาท/หน่วย

4. ถ้าเดือนแรกไม่มีรายได้เลย อยู่ได้กี่เดือน?
   → [capital] / [monthly_burn] = [ ] เดือน
```

### GRILL Batch 2 — Customer Acquisition (4 ข้อ)

```
5. วันแรกเปิด ลูกค้าจะมาจากไหน?
   → ช่องทางที่แน่นอน: [ ] → คาดว่าได้ [ ] คน

6. Conversion rate คาดหวังเท่าไหร่?
   → คนเห็น [ ] → คนซื้อ [ ] = [ ]%

7. ลูกค้าซื้อซ้ำไหม?
   → [ ]% ซื้อซ้ำ ค่าเฉลี่ย [ ] ครั้ง/เดือน

8. ถ้าต้องใช้โฆษณา งบต่อลูกค้าใหม่เท่าไหร่?
   → งบโฆษณา [ ] / ลูกค้าใหม่ [ ] = [ ] บาท/คน
```

### GRILL Batch 3 — Operational Risk (4 ข้อ)

```
9. ถ้าพนักงานลาออก 1 คน → ธุรกิจกระทบไหม?
   → [ใช่/ไม่] → [เพราะ] → [ทำอย่างไร]

10. ขั้นตอนที่ต้องทำทุกวัน = อะไรบ้าง?
    → ระบุ [ ] ขั้นตอน

11. ถ้าซื้อของไม่ได้ 1 สัปดาห์ → กระทบไหม?
    → [ใช่/ไม่] → [เพราะ]

12. ถ้าต้องขยาย 3 เท่า → ทำได้ไหม?
    → [ได้/ไม่ได้] → [เพราะ]
```

### GRILL Batch 4 — Competitive Moat (4 ข้อ)

```
13. ถ้าร้านข้างๆ เปิดขายราคาเท่ากัน → ลูกค้าจะอยู่กับเราไหม?
    → [ใช่/ไม่] → [เพราะ]

14. สิ่งที่กันคู่แข่ง copy ได้ยากที่สุด = อะไร?
    → [ ]

15. ถ้าคู่แข่งมีเงินมากกว่าเรา 5 เท่า → จะเกิดอะไร?
    → [ ]

16. ทำไมธุรกิจนี้จะยั่งยืนในระยะ 3 ปี?
    → [ ]
```

---

## Follow-up Loop

หลังได้คำตอบครบ batch:
1. วิเคราะห์ → หา assumption ที่อันตรายที่สุด
2. ถาม follow-up 1-3 ข้อ เฉพาะที่ critical
3. ถ้าไม่ critical → ไป next batch หรือ phase ถัดไป

### Follow-up Trigger Examples

```
Q: "น่าจะได้ลูกค้าเยอะ"
→ "เยอะ คือกี่คน? ช่องทางไหน? ทำไมถึงมาหาเรา?"

Q: "ราคาต่ำกว่าคู่แข่ง"
→ "ต่ำกว่าเท่าไหร่? margin เท่าไหร่? อยู่ได้ไหม?"

Q: "คุณภาพดีกว่า"
→ "วัดยังไง? ใครบอก? ลูกค้ายินดีจ่ายเท่าไหร่?"

Q: "ไม่มีคู่แข่ง"
→ "จริงหรือ? ถ้ามี 1 รายเข้ามา จะเกิดอะไร?"

Q: "ขายได้แล้ว"
→ "ขายได้กี่ชิ้น/เดือน? ทำซ้ำได้ไหม?"

Q: "กำไรดี"
→ "margin กี่%? คิด overhead ไปหรือยัง?"
```

---

## High-Risk Assumption Marking

ทุกครั้งที่ user ตอบเป็น assumption:

```
1. ตอบ: "**[Assumption Marked]** → [assumption] — ถือว่า [value] ก่อน"
2. บอก: "ถ้าผิด → [ผลกระทบ]"
3. กำหนด: "จะ validate ด้วย [metric/method]"
```

### Marking Format

```markdown
**Assumption:** customer_acquisition = "ผ่านคนเดิน รพ."
**Why dangerous:** ถ้า conversion ต่ำกว่า 5% → break-even ไม่ถึง
**Validation:** นับคนเดินผ่าน 1 วัน × estimate conversion
```

---

## Escalation Logic

### ถ้า user ไม่ตอบคำถามใดๆ เลย

```
→ แสดง current state ที่รู้ + ถามว่า "ข้อมูลที่ขาดคืออะไร?"
```

### ถ้า user ตอบสั้นมาก

```
→ Challenge ด้วย: "บอกมากกว่านี้หน่อยได้ไหม"
```

### ถ้า user ให้ contradiction

```
→ ชี้ว่า: "ก่อนหน้าบอก [A] แต่ตอนนี้บอก [B] → อันไหนถูก?"
→ รอ clarification
→ ห้าม advance จนกว่าจะ resolve
```

---

## Report Gate Awareness

GRILL phase ยังไม่สร้าง recommendation เต็มรูปแบบ

GRILL output:
- สมมติฐานที่อันตรายที่สุด 3 ข้อ
- สิ่งที่รู้แล้ว (Known Facts)
- สิ่งที่ต้อง validate (Research needed)
- คำถามที่ยังไม่ได้คำตอบ (Unknowns)

Recommendation จะถูกสร้างใน phase สุดท้าย (recommendation) หลังผ่าน research + modeling + risk

---

## Obsidian Logging

ทุก Q&A → log ไป venture note ทันที

```markdown
### 👤 HERMES [HH:MM:SS]
[คำถาม]

---

### 👤 USER [HH:MM:SS]
[คำตอบ]

---

**High-Risk Assumption:** [text]
**Why dangerous:** [reason]
**Validation:** [how to check]
```

---

## ตัวอย่าง correct behavior

**User:** `/bf ร้านกาแฟ specialty ใกล้โรงพยาบาล`

**Hermes (INTAKE):**
```
📋 ฉันจะทำ feasibility study แบบ "เจ๊งในกระดาษ" ให้ — ถามก่อน 5 ข้อที่มีผลต่อความอยู่รอดจริง

ตอบเท่าที่รู้ ไม่รู้ก็บอกไม่รู้ — ฉันจะหา benchmark ให้

1. ธุรกิจคืออะไร? (ขายอะไร ให้ใคร สรุปสั้นๆ)
2. ลูกค้ากลุ่มแรกที่จะเป็นลูกค้าคือใคร?
3. ทำเลอยู่ที่ไหน?
4. มีประสบการณ์ในธุรกิจนี้ไหม?
5. เป้าหมายคืออะไร?
```

**รอ response** → ห้ามถามต่อ ห้ามสร้าง SWOT

---

## ตัวอย่าง incorrect behavior (ห้ามทำ)

```
❌ "นี่คือ SWOT analysis ของร้านกาแฟของคุณ..."
❌ "คุณน่าจะมี strengths คือ..."
❌ "แนะนำให้ทำ X, Y, Z เพราะ..."
```

---

## Four Focus Areas (สำหรับ GRILL)

### 1. Financial Structure
- งบลงทุนแบ่งเป็นอะไรบ้าง
- Fixed cost vs Variable cost
- Margin ต่อหน่วย
- Runway ถ้าไม่มีรายได้

### 2. Traffic & Conversion
- ลูกค้าจะมาจากไหน (ช่องทางที่แน่นอน)
- Conversion rate
- Repeat purchase rate
- CAC

### 3. Operational Reality
- ต้องมีคนกี่คน
- Dependencies ที่เป็นปัญหาได้
- Standardization ทำได้ไหม
- Bottleneck แรกที่จะเจอ

### 4. Competitive Advantage
- ทำไมลูกค้าต้องซื้อจากเราแทนเจ้าเดิม
- Moat ที่แท้จริงคืออะไร
- ถ้าคู่แข่ง copy ได้ → อยู่ได้ไหม

---

## Phase Transition Rules

```
[intake] ──(2+ required fields, no critical unknown)──→ [grill]
[grill] ──(3 assumptions marked, no vague critical)──→ [research]
[research] ──(benchmark ready)──→ [modeling]
[modeling] ──(3 scenarios done)──→ [risk]
[risk] ──(top 3 risks mapped)──→ [recommendation]
```

ห้าม skip phase ใดๆ