#!/usr/bin/env bash
# Cowork Webinar — demo files fetcher (macOS / Linux / WSL)
# Run with:  curl -fsSL https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main/fetch-demos.sh | bash
# Downloads the demo files into ~/Desktop/Cowork-Demo-Files, one subfolder per demo.
# Files used by several demos are placed into each of those folders.
# The MAP below is the single source of truth — add a line here when a new demo is added.
set -euo pipefail

BASE="https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main"
ROOT="$HOME/Desktop/Cowork-Demo-Files"

# demo folder | comma-separated files  ('' = live demo, no file)
MAP="$(cat <<'EOF'
00_Flagship_Everything-Flow|strategy_offsite_transcript.docx,q3_financials.xlsx
01_Week-Ahead|c30_executive_week_ahead.xlsx
02_Margin-Leak|product_margin_raw.xlsx
03_1on1-Prep_LIVE-no-file|
04_QBR-Prep|c21_qbr_prep_cross_app.xlsx
05_Product-Launch|c24_product_launch_tracker.xlsx
06_Sales-Cockpit|regional_sales_raw.xlsx
07_Transcript-to-Deck|strategy_offsite_transcript.docx
08_Survey-to-Deck|employee_engagement_survey.csv
09_Contracts|contract_northwind.pdf,contract_contoso.pdf,contract_fabrikam.pdf
10_Financials|q3_financials.xlsx
11_Email-to-Decision|budget_approval_email_thread.txt
EOF
)"

echo "→ Target: $ROOT"
rm -rf "$ROOT"; mkdir -p "$ROOT/_src"

# download each unique file once
echo "$MAP" | awk -F'|' 'NF>1{print $2}' | tr ',' '\n' | sed '/^$/d' | sort -u | while read -r f; do
  curl -fsSL "$BASE/$f" -o "$ROOT/_src/$f" && echo "  ✓ downloaded $f"
done

# distribute into per-demo folders
while IFS='|' read -r demo files; do
  [ -z "$demo" ] && continue
  dir="$ROOT/$demo"; mkdir -p "$dir"
  if [ -z "$files" ]; then
    echo "No file — live Work IQ (Outlook / Tasks / Teams / Calendar)." > "$dir/NOTE.txt"; continue
  fi
  IFS=','; for f in $files; do cp "$ROOT/_src/$f" "$dir/"; done; unset IFS
done <<< "$MAP"

rm -rf "$ROOT/_src"
echo "✅ Done → $ROOT"
