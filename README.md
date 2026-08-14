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

Beide Ordner enthalten dieselben 18 nummerierten Dateien. Hub und Prompt-Dateien
verwenden denselben Demo-Umfang und dieselben Sicherheitsgrenzen.

Both folders contain the same 18 numbered files. The hub and prompt files use
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
| `aurora-persona-trigger-emails.txt` | Exact DE/EN messages for Leila and Preston desktops | 18 · Aurora Multi-User Handoff |
| `ap_policy.docx` | Authoritative matching policy, tolerances, exception codes, controls, and SLAs | 17 · AP Three-Way Match |
| `ap_po_lines.xlsx` | Detailed synthetic purchase-order lines | 17 · AP Three-Way Match |
| `ap_goods_receipts.csv` | Accepted/rejected and partial goods receipts | 17 · AP Three-Way Match |
| `ap_vendor_master.xlsx` | Vendor status, currency, tax, owner, and risk data | 17 · AP Three-Way Match |
| `ap_invoice_*.pdf` | Nine selectable-text invoices with planted match and exception scenarios | 17 · AP Three-Way Match |

Demos 03, 12, 13, 14, 15, 16, and 18 use live Microsoft 365 context or prompt-only
inputs and do not require an uploaded source file.

---

## Quick action demos / Schnelle Action-Demos

### 13 · Teams Executive Update

**DE:** Vier Statuspunkte werden zu einem professionellen Teams-Post für den
eigenen Teams-Chat (Chat mit mir selbst). Die Post-Vorschau zeigen und erst nach
Freigabe posten.

**EN:** Four status bullets become a professional Teams post for your own Teams
chat (chat with myself). Show the post preview and post only after approval.

### 14 · Outlook Customer Follow-up

**DE:** Rohe Gesprächsnotizen werden zu einer strukturierten Follow-up-Mail. Der
Hub verwendet das eigene Demo-Postfach als sicheren Empfänger.

**EN:** Rough meeting notes become a structured follow-up email. The hub uses
the demo mailbox itself as the safe recipient.

### 15 · Inbox Triage to Excel

**DE:** Cowork prüft höchstens 15 ungelesene synthetische Mails, erstellt
`Inbox-Action-Register.xlsx` und entwirft eine Antwort. Nachrichten nicht
löschen, verschieben, archivieren, als gelesen markieren oder anderweitig
verändern; den Entwurf nicht senden.

**EN:** Cowork reviews no more than 15 unread synthetic messages, creates
`Inbox-Action-Register.xlsx`, and drafts one reply. Do not delete, move,
archive, mark as read, or otherwise change messages; do not send the draft.

### 16 · Teams Incident Response — optional

**DE:** Diese Demo ist ausdrücklich optional. Nur eine neue Teams-Kanalnachricht,
die sowohl die exakte Markierung `[COWORK-DEMO]` als
auch eine echte @Erwähnung des Demo-Benutzers enthält, startet eine neue
Conversation. Der Run erstellt `Incident-Response-Brief.docx` sowie Outlook-
und Teams-Entwürfe; Senden und Posten erfordern jeweils eine ausdrückliche
Freigabe. Den deterministischen Testfall aus dem Prompt in einem internen Kanal
ausführen und einen abgeschlossenen Run geöffnet halten. Wenn der Trigger nicht
rechtzeitig feuert, den manuellen Fallback-Prompt in einer neuen Conversation
verwenden.

**EN:** This demo is explicitly optional. Only a new Teams channel message that
both contains the exact marker `[COWORK-DEMO]` and genuinely
@mentions the demo user starts a new conversation. The run creates
`Incident-Response-Brief.docx` plus Outlook and Teams drafts; sending and
posting each require explicit approval. Run the deterministic test case from
the prompt in an internal channel and keep a completed run open. If the trigger does
not fire in time, use the manual fallback prompt in a new conversation.

### 17 · AP Three-Way Invoice Match

**DE:** Diese deterministische Operations-Demo gleicht neun synthetische
Rechnungen zeilenweise mit Bestellungen und akzeptierten Wareneingängen ab.
`ap_policy.docx` ist verbindlich. Cowork erstellt ein kontrolliertes
Excel-Workbook, Review-Memo, Vendor-Klärungsentwürfe, Run Log und einen
Outlook-Entwurf. Es darf keine Zahlung genehmigen oder buchen. Für den
Live-Termin die Artefakte einmal vorab erzeugen und mit
`runbook/AP_Match_Expected_Results.xlsx` im privaten Presenter-Repo vergleichen.

**EN:** This deterministic operations demo matches nine synthetic invoices at
line level against purchase orders and accepted goods receipts.
`ap_policy.docx` is authoritative. Cowork creates a controlled Excel workbook,
review memo, vendor clarification drafts, run log, and an Outlook draft. It
must not approve or post any payment. Before the live session, generate the
artifacts once and compare them with `runbook/AP_Match_Expected_Results.xlsx`
in the private presenter repository.

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

- [ ] Select **EN** in the hub and open every tab once. / Im Hub **EN**
      auswählen und jeden Tab einmal öffnen.
- [ ] Seed the English tenant session with
      `python cwdemo.py session --session 2`. / Die englischen Tenant-Daten mit
      `python cwdemo.py session --session 2` bereitstellen.
- [ ] Upload the file-based demo inputs to OneDrive/SharePoint. / Die
      dateibasierten Demo-Inputs nach OneDrive/SharePoint hochladen.
- [ ] Pre-run the longer artifact demos and keep screenshots/results ready. /
      Längere Artefakt-Demos vorab ausführen und Screenshots/Ergebnisse bereithalten.
- [ ] Verify your own Teams chat for demo 13; test demo 16 in an internal channel
      using the marker and a genuine @mention. / Für Demo 13 den eigenen
      Teams-Chat prüfen; Demo 16 in einem internen Kanal mit Marker und echter
      @Erwähnung testen.
- [ ] Confirm synthetic unread messages are available; demo 15 processes up to
      15. / Synthetische ungelesene Mails prüfen; Demo 15 verarbeitet höchstens 15.
- [ ] Keep all communication actions in draft-and-approve mode. / Alle
      Kommunikationsaktionen im Modus „Entwurf und Freigabe“ belassen.
- [ ] Pre-run demos 13–15 and keep verified post/email previews,
      `Inbox-Action-Register.xlsx`, and screenshots open as fallbacks. / Demos
      13–15 vorab ausführen und geprüfte Vorschauen, Register und Screenshots öffnen.
- [ ] Treat demo 16 as optional; keep its manual prompt and completed run ready. /
      Demo 16 optional halten; manuellen Prompt und abgeschlossenen Run bereithalten.
- [ ] Attach all 13 demo-17 inputs together and keep the validated expected-results
      workbook plus prepared outputs ready. / Alle 13 Inputs für Demo 17 gemeinsam
      anhängen und Erwartungsdatei sowie vorbereitete Ergebnisse bereithalten.

---

## License

MIT License. Synthetic demo content only.
