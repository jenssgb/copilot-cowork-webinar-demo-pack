# Microsoft 365 Copilot Cowork — Webinar Demo Pack

Reproduzierbare Demodaten, zweisprachige Copy-Paste-Prompts und ein sicherer
Live-Ablauf für Microsoft 365 Copilot Cowork.

Reproducible demo data, bilingual copy-paste prompts, and a safe live workflow
for Microsoft 365 Copilot Cowork.

Alle Inhalte sind synthetisch. / All content is synthetic.

---

## Was ist Cowork? / What is Cowork?

**DE:** Cowork führt mehrstufige Aufgaben über Outlook, Teams, Word, Excel,
PowerPoint, Kalender und weitere verbundene Systeme aus. Sensible Aktionen wie
Senden oder Posten werden vor der Ausführung zur Freigabe angezeigt.

**EN:** Cowork carries out multi-step tasks across Outlook, Teams, Word, Excel,
PowerPoint, Calendar, and connected systems. Sensitive actions such as sending
or posting are shown for approval before they happen.

- **Automation:** Scheduled prompts and event-driven email/Teams tasks
- **Artifacts:** Word, Excel, PowerPoint, PDF, email, and adaptive content
- **Extensions:** Skills and plugins, including MCP-based connectors
- **Control:** Pause/resume/cancel, action previews, and draft-and-approve

Official sources:

- <https://learn.microsoft.com/microsoft-365-copilot/cowork/>
- <https://learn.microsoft.com/microsoft-365-copilot/cowork/use-cowork>
- <https://learn.microsoft.com/microsoft-365-copilot/cowork/cowork-plugins>

---

## Installation / Install

**Windows PowerShell**

```powershell
irm https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main/fetch-demos.ps1 | iex
```

**macOS, Linux, or WSL**

```bash
curl -fsSL https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main/fetch-demos.sh | bash
```

Die Skripte erstellen `Desktop/Cowork-Demo-Files`, Demo-Unterordner sowie
`_Prompts_DE` und `_Prompts_EN`.

The scripts create `Desktop/Cowork-Demo-Files`, per-demo folders, and
`_Prompts_DE` plus `_Prompts_EN`.

Dateibasierte Inputs anschließend nach OneDrive oder SharePoint hochladen,
beispielsweise nach `Microsoft/Copilot-Demos/`.

Upload file-based inputs to OneDrive or SharePoint afterward, for example to
`Microsoft/Copilot-Demos/`.

---

## Prompts

| Language / Sprache | Folder / Ordner |
|---|---|
| Deutsch | [`prompts/de/`](prompts/de/) |
| English | [`prompts/en/`](prompts/en/) |

Beide Ordner enthalten dieselben 16 nummerierten Dateien. Hub und Prompt-Dateien
verwenden denselben Demo-Umfang und dieselben Sicherheitsgrenzen.

Both folders contain the same 16 numbered files. The hub and prompt files use
the same demo scope and safety boundaries.

---

## Demo inputs

| File | Content | Demo |
|---|---|---|
| `c30_executive_week_ahead.xlsx` | Calendar and pending-email data | 01 · Executive Week-Ahead |
| `product_margin_raw.xlsx` | Product pricing, cost, discount, and channel data | 02 · The Margin Leak |
| `c21_qbr_prep_cross_app.xlsx` | Account health, tickets, success plan, agenda | 04 · QBR Prep |
| `c24_product_launch_tracker.xlsx` | Launch plan, stakeholders, blockers | 05 · Product Launch |
| `regional_sales_raw.xlsx` | Regional sales rows with inconsistent labels | 06 · Sales Cockpit |
| `strategy_offsite_transcript.docx` | English leadership-offsite transcript | 07 · Transcript to Deck |
| `employee_engagement_survey.csv` | English survey responses | 08 · Survey to Deck |
| `contract_northwind.pdf`, `contract_contoso.pdf`, `contract_fabrikam.pdf` | Synthetic vendor contracts | 09 · Contract Comparison |
| `q3_financials.xlsx` | P&L, segments, KPIs, and ledger detail | 10 · Financials to Board |
| `budget_approval_email_thread.txt` | English decision email thread | 11 · Email to Decision |
| `event-driven-learn-trigger-email.txt` | DE/EN trigger subjects and message bodies | Event-driven Learn reply |

Demos 03, 12, 13, 14, 15, and 16 use live Microsoft 365 context or prompt-only
inputs and do not require an uploaded source file.

---

## Quick action demos / Schnelle Action-Demos

### 13 · Teams Executive Update

**DE:** Vier Statuspunkte werden zu einem professionellen Teams-Post. Vor dem
Webinar `[SICHERER DEMO-KANAL]` durch einen internen Testkanal ersetzen und die
Post-Vorschau zeigen; erst nach Freigabe posten.

**EN:** Four status bullets become a professional Teams post. Replace
`[SAFE DEMO CHANNEL]` with an internal test channel before the webinar, show
the post preview, and post only after approval.

### 14 · Outlook Customer Follow-up

**DE:** Rohe Gesprächsnotizen werden zu einer strukturierten Follow-up-Mail. Der
Hub verwendet das eigene Demo-Postfach als sicheren Empfänger.

**EN:** Rough meeting notes become a structured follow-up email. The hub uses
the demo mailbox itself as the safe recipient.

### 15 · Inbox Triage to Excel

**DE:** Cowork prüft höchstens 15 ungelesene synthetische Mails, erstellt
`Inbox-Action-Register.xlsx` und entwirft eine Antwort. Nichts löschen,
verschieben oder senden.

**EN:** Cowork reviews no more than 15 unread synthetic messages, creates
`Inbox-Action-Register.xlsx`, and drafts one reply. Do not delete, move, or send.

### 16 · Teams Incident Response — optional

**DE:** Eine eng begrenzte `[COWORK-DEMO]`-@Mention startet einen Event-Run, der
ein Incident-Briefing sowie Mail- und Teams-Entwürfe vorbereitet. Vorab testen
und einen abgeschlossenen Run als Fallback geöffnet halten.

**EN:** A narrowly scoped `[COWORK-DEMO]` @mention starts an event run that
prepares an incident brief plus email and Teams drafts. Test it beforehand and
keep a completed run open as the fallback.

---

## Event-driven Microsoft Learn reply

1. Activate the trigger prompt from the hub for subjects beginning with
   `[COWORK-DEMO]`.
2. Open `event-driven-learn-trigger-email.txt`.
3. Send the matching DE or EN message from a second mailbox to
   `admin@M365CPI98544940.onmicrosoft.com`.
4. Open the run under **Scheduled**, then show the formatted Outlook reply
   draft. Do not send it.

The Microsoft Learn MCP connector must already be packaged, enabled, and
connected if the presenter wants to claim MCP grounding. Without it, describe
the run as Deep Research rather than guaranteed MCP tool use.

---

## Pre-flight / Vor dem Webinar

- [ ] Select **EN** in the hub and open every tab once.
- [ ] Seed the English tenant session with
      `python cwdemo.py session --session 2`.
- [ ] Upload the file-based demo inputs to OneDrive/SharePoint.
- [ ] Pre-run the longer artifact demos and keep screenshots/results ready.
- [ ] Choose and test a safe internal Teams channel for demos 13 and 16.
- [ ] Confirm synthetic unread messages are available; demo 15 processes up to 15.
- [ ] Keep all communication actions in draft-and-approve mode.
- [ ] Treat demo 16 as optional; keep its manual prompt and completed run ready.

---

## License

MIT License. Synthetic demo content only.
