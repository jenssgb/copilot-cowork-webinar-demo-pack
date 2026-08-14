# Cowork Webinar — demo files fetcher (Windows / PowerShell)
# Run with:  irm https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main/fetch-demos.ps1 | iex
# Downloads the demo files into <visible Desktop>/Cowork-Demo-Files, one subfolder per demo.
# Files used by several demos are placed into each of those folders.
# The MAP below is the single source of truth — add a line here when a new demo is added.

$ErrorActionPreference = 'Stop'
$ProgressPreference     = 'SilentlyContinue'   # much faster downloads

$Base = 'https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main'
$Root = Join-Path ([Environment]::GetFolderPath('Desktop')) 'Cowork-Demo-Files'   # respects OneDrive redirect

# demo folder  ->  comma-separated files ('' = live demo, no file)
$Map = [ordered]@{
  '00_Flagship_Everything-Flow' = 'strategy_offsite_transcript.docx,q3_financials.xlsx'
  '01_Week-Ahead'               = 'c30_executive_week_ahead.xlsx'
  '02_Margin-Leak'              = 'product_margin_raw.xlsx'
  '03_1on1-Prep_LIVE-no-file'   = ''
  '04_QBR-Prep'                 = 'c21_qbr_prep_cross_app.xlsx'
  '05_Product-Launch'           = 'c24_product_launch_tracker.xlsx'
  '06_Sales-Cockpit'            = 'regional_sales_raw.xlsx'
  '07_Transcript-to-Deck'       = 'strategy_offsite_transcript.docx'
  '08_Survey-to-Deck'           = 'employee_engagement_survey.csv'
  '09_Contracts'                = 'contract_northwind.pdf,contract_contoso.pdf,contract_fabrikam.pdf'
  '10_Financials'               = 'q3_financials.xlsx'
  '11_Email-to-Decision'        = 'budget_approval_email_thread.txt'
  '12_Contoso-Design-Skill_LIVE-no-file' = ''
  '13_Teams-Executive-Update_LIVE' = ''
  '14_Outlook-Follow-up_LIVE' = ''
  '15_Inbox-to-Excel_LIVE' = ''
  '16_Teams-Incident-Response_OPTIONAL' = ''
  '17_AP-Three-Way-Match' = 'ap_policy.docx,ap_po_lines.xlsx,ap_goods_receipts.csv,ap_vendor_master.xlsx,ap_invoice_AC-1042.pdf,ap_invoice_NL-8821.pdf,ap_invoice_FF-2207.pdf,ap_invoice_CC-7710.pdf,ap_invoice_TS-5520-A.pdf,ap_invoice_TS-5520-B.pdf,ap_invoice_LT-3901.pdf,ap_invoice_AC-1043.pdf,ap_invoice_NL-8822.pdf'
  'Automation_Event-Driven-Learn-Reply' = 'event-driven-learn-trigger-email.txt'
}

Write-Host "→ Target: $Root"
Remove-Item -Recurse -Force $Root -ErrorAction SilentlyContinue | Out-Null

# download each unique file exactly once
$unique = $Map.Values | Where-Object { $_ } | ForEach-Object { $_.Split(',') } | Sort-Object -Unique
$cache  = @{}
foreach ($f in $unique) {
  $tmp = Join-Path $env:TEMP $f
  Invoke-WebRequest "$Base/$f" -OutFile $tmp
  $cache[$f] = $tmp
  Write-Host "  ✓ downloaded $f"
}

# distribute into per-demo folders
foreach ($demo in $Map.Keys) {
  $dir = Join-Path $Root $demo
  New-Item -ItemType Directory -Force -Path $dir | Out-Null
  if (-not $Map[$demo]) {
    'No file — live Work IQ (Outlook / Tasks / Teams / Calendar).' | Out-File "$dir\NOTE.txt"
    continue
  }
  foreach ($f in $Map[$demo].Split(',')) { Copy-Item $cache[$f] (Join-Path $dir $f) -Force }
}

$PromptNames = 1..17 | ForEach-Object {
  switch ($_){
    1 {'01-executive-week-ahead.txt'} 2 {'02-margin-leak.txt'} 3 {'03-weekly-1on1-prep.txt'}
    4 {'04-qbr-prep-cross-app.txt'} 5 {'05-product-launch-command-center.txt'}
    6 {'06-sales-performance-cockpit.txt'} 7 {'07-offsite-transcript-to-deck.txt'}
    8 {'08-engagement-survey-to-deck.txt'} 9 {'09-contracts-compare-to-word.txt'}
    10 {'10-financials-to-board-deck.txt'} 11 {'11-email-thread-to-decision.txt'}
    12 {'12-contoso-design-skill.txt'} 13 {'13-teams-executive-update.txt'}
    14 {'14-outlook-customer-follow-up.txt'} 15 {'15-inbox-triage-to-excel.txt'}
    16 {'16-teams-incident-response.txt'} 17 {'17-ap-three-way-invoice-match.txt'}
  }
}
foreach ($lang in @('de','en')) {
  $promptDir = Join-Path $Root ("_Prompts_" + $lang.ToUpperInvariant())
  New-Item -ItemType Directory -Force -Path $promptDir | Out-Null
  foreach ($name in $PromptNames) {
    Invoke-WebRequest "$Base/prompts/$lang/$name" -OutFile (Join-Path $promptDir $name)
  }
}

$unique | ForEach-Object { Remove-Item $cache[$_] -ErrorAction SilentlyContinue }
Write-Host "✅ Done — $($Map.Count) demo folders + DE/EN prompts in $Root"
Start-Process explorer.exe $Root
