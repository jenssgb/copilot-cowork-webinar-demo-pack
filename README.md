# Copilot Cowork — Webinar Demo-Pack

Reproducible data files, copy-paste prompts and a step-by-step run book for a **Microsoft 365 Copilot Cowork** live demo (webinar of 12 Aug 2026, 50-minute live segment).

Everything here is **synthetic demo data** — fictional companies, people and numbers. Nothing confidential.

---

## What is Cowork? (grounded in Microsoft Learn)

Microsoft 365 Copilot **Cowork** is an AI agent that carries out **multi-step tasks across Microsoft 365**. You describe what you need in natural language and Cowork does the work — sending emails, scheduling meetings, creating Word/Excel/PowerPoint/PDF files, posting in Teams, searching your organization and doing deep research. Every step is visible in the conversation, and **sensitive actions require your explicit approval** before they run.

- **Built-in skills:** Word, Excel, PowerPoint, PDF, Email, Scheduling, Calendar Management, Meetings, Daily Briefing, Enterprise Search, Communications, Deep Research, Adaptive Cards, Skill Management.
- **Custom skills:** up to **50**, stored in OneDrive at `Documents/Cowork/skills/{name}/SKILL.md` (up to 20 companion files, 5 MB each / 10 MB per skill).
- **Plugins:** from the Microsoft 365 App Store — Microsoft (Dynamics 365 Sales / Customer Service / Finance & Operations, Fabric IQ) and partners (Atlassian, Miro, monday.com, LSEG, S&P Global Energy).
- **Automation:** scheduled prompts + event-driven tasks.
- **Control:** action approval with risk indicator, pause / resume / cancel, conversation-scoped memory.
- **Get started:** browser at <https://m365.cloud.microsoft>, the Microsoft 365 Copilot desktop app (Windows/Mac) or the mobile app (iOS/Android).

Sources:
- Cowork overview — <https://learn.microsoft.com/microsoft-365-copilot/cowork/>
- Cowork application card (responsible AI) — <https://learn.microsoft.com/microsoft-365-copilot/responsible-ai/copilot-cowork-application-card>

---

## Install the demo files

Pick **one** of the following.

**A) One-liner (macOS/Linux/WSL):**
```bash
curl -fsSL https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main/install.sh | bash
```
Downloads the four `.xlsx` files into `./cowork-webinar-demo-pack/`.

**B) Clone the repo:**
```bash
git clone https://github.com/jenssgb/copilot-cowork-webinar-demo-pack.git
```

**C) Download ZIP (no tools needed):**
<https://github.com/jenssgb/copilot-cowork-webinar-demo-pack/archive/refs/heads/main.zip>

Then **upload the four `.xlsx` files to OneDrive or SharePoint** (suggested folder: `Microsoft/Copilot-Demos/`) so Cowork can reach them. Cowork works with cloud files (OneDrive/SharePoint/Teams), not local disk.

---

## Data files

| File | Sheets | Used by |
|------|--------|---------|
| `product_margin_raw.xlsx` | 80 SKUs — SKU, Category, Sales Channel, List Price, COGS, Channel Fee, Ads/Unit, Discount %, Net Revenue/Unit | Demo 2 · The Margin Leak |
| `c21_qbr_prep_cross_app.xlsx` | Account Health, QBR Agenda Template, Success Plan, Support Tickets, Pre-Read Email Draft | Demo 4 · QBR Prep |
| `c24_product_launch_tracker.xlsx` | Launch Overview, GTM Checklist (25 tasks), Stakeholder Map (12), Launch Brief Data | Demo 5 · Product Launch |
| `c30_executive_week_ahead.xlsx` | Calendar Next Week (8 meetings), Pending Emails (6) | Demo 1 · Week-Ahead |

---

## Run book — 5 live demos

Prompts are also in [`prompts/`](prompts/) as individual copy-paste files.

### Demo 1 — Executive Week-Ahead  ·  Calendar + Outlook + Word
**File:** `c30_executive_week_ahead.xlsx`
```
Using c30_executive_week_ahead.xlsx, prep my week ahead.
1. From the "Calendar Next Week" sheet, pick the 5 most important external meetings by Priority.
2. For each, research the company and the attendee's role (use the Context column plus enterprise search) and write a 1-page briefing in Word: who is in the room, why it matters, 3 talking points, and 1 risk.
3. From the "Pending Emails" sheet, list the emails that need a decision from me, each with a recommended next step.
4. Draft short pre-meeting emails for the top 3 meetings. Keep them as drafts for my approval — do not send.
Save all briefings to OneDrive as "Week-Ahead Briefings.docx".
```
*Live variant:* point it at your real calendar for extra wow ("Look at my calendar for next week …").

### Demo 2 — The Margin Leak  ·  Excel (single-app power)
**File:** `product_margin_raw.xlsx`
```
Open product_margin_raw.xlsx. Build a Product Margin Intelligence workbook:
1. MARGIN HEALTH DASHBOARD: overall margin %, total revenue, total profit, negative-margin count, average margin by Category, a RAG traffic-light (Green >=25%, Amber 10-24%, Red <10%), and a donut chart of revenue by Category.
2. MARGIN KILLERS SHEET: every product with Margin % < 10%, sorted by total profit impact (worst first), with a Recommended Action column.
3. CHANNEL PROFITABILITY PIVOT: average margin % and total profit per Sales Channel, with a bar chart.
4. EXECUTIVE SUMMARY: company-wide margin %, plus the top 3 recommendations.
```

### Demo 3 — Weekly 1:1 Prep  ·  Outlook + Tasks + Teams + Calendar + Word
**No file — uses your live Work IQ.**
```
Prepare my weekly 1:1 with my VP for today's meeting in 30 minutes.
Pull context from my sent emails this week, completed tasks and open action items,
Teams @mentions from the past 7 days, and this week's calendar meetings.
Create a 1-page briefing: TOP 3 WINS, BLOCKERS & ESCALATIONS, DECISIONS NEEDED,
WHAT I'M WORKING ON NEXT, ONE QUESTION FOR THEM. Save to OneDrive as "1on1-prep.docx".
```

### Demo 4 — QBR Prep  ·  Excel + PowerPoint + Word + Outlook + Calendar
**File:** `c21_qbr_prep_cross_app.xlsx`
```
Using c21_qbr_prep_cross_app.xlsx, build a complete Q3 QBR prep pack for Apex Financial Services (health score 61, NPS 6.1, 14 open support tickets, $80K expansion opportunity — a RED account).
1. EXCEL — Summarize Apex's key metrics, risks, and expansion potential.
2. POWERPOINT — Generate a 12-slide QBR deck with RAG indicators.
3. WORD — Create a formal 60-minute QBR agenda with a timing breakdown.
4. OUTLOOK — Draft the pre-read email to the champion (CC: exec sponsor). Keep it as a draft for my approval.
5. CALENDAR — Find a 60-minute slot next week and create the QBR invite. Show it to me for approval before creating it.
```

### Demo 5 — Product Launch Command Center  ·  Excel + Word + PowerPoint + Outlook + Calendar + Teams
**File:** `c24_product_launch_tracker.xlsx`
```
Using c24_product_launch_tracker.xlsx, stand up our Q3 product launch for Aurora AI Analytics:
1. Build the GTM checklist in Excel with owners and deadlines.
2. Write the 2-page launch brief in Word.
3. Generate a 10-slide launch deck in PowerPoint.
4. Send the stakeholder kickoff email to all 12 stakeholders. Keep it as a draft for my approval.
5. Schedule the launch war-room meeting for next Monday. Show it to me for approval before creating it.
6. Open a Teams channel "Project Aurora Launch" with the brief pinned.
```

Two more live segments need **no file**: **Skills & Customize** (create a custom skill in the Cowork *Customize* page) and **Plugins** (show the *Plugins* tab — Installed + Discover).

---

## Pre-flight checklist

- [ ] All four `.xlsx` uploaded to OneDrive/SharePoint (`Microsoft/Copilot-Demos/`)
- [ ] Run Demo 2, 4, 5 once and save the finished outputs as a screenshot backup
- [ ] Cowork *Customize* page: Skills + Plugins tabs load
- [ ] Backup plan: keep prepared results ready in case Cowork is slow

---

## License

Demo content released under the MIT License (see `LICENSE`). Synthetic data only.
