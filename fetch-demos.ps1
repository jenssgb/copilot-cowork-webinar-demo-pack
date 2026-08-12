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

$unique | ForEach-Object { Remove-Item $cache[$_] -ErrorAction SilentlyContinue }
Write-Host "✅ Done — $($Map.Count) demo folders in $Root"
Start-Process explorer.exe $Root
