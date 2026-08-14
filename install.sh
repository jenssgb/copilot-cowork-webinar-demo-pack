#!/usr/bin/env bash
# Copilot Cowork — Webinar Demo-Pack installer
# Downloads the demo data files into ./cowork-webinar-demo-pack/ (or $1).
set -euo pipefail

DEST="${1:-cowork-webinar-demo-pack}"
BASE="https://raw.githubusercontent.com/jenssgb/copilot-cowork-webinar-demo-pack/main"
FILES=(
  product_margin_raw.xlsx
  c21_qbr_prep_cross_app.xlsx
  c24_product_launch_tracker.xlsx
  c30_executive_week_ahead.xlsx
  regional_sales_raw.xlsx
  q3_financials.xlsx
  employee_engagement_survey.csv
  strategy_offsite_transcript.docx
  contract_northwind.pdf
  contract_contoso.pdf
  contract_fabrikam.pdf
  budget_approval_email_thread.txt
  event-driven-learn-trigger-email.txt
  ap_policy.docx
  ap_po_lines.xlsx
  ap_goods_receipts.csv
  ap_vendor_master.xlsx
  ap_invoice_AC-1042.pdf
  ap_invoice_NL-8821.pdf
  ap_invoice_FF-2207.pdf
  ap_invoice_CC-7710.pdf
  ap_invoice_TS-5520-A.pdf
  ap_invoice_TS-5520-B.pdf
  ap_invoice_LT-3901.pdf
  ap_invoice_AC-1043.pdf
  ap_invoice_NL-8822.pdf
  README.md
)

mkdir -p "$DEST"
echo "→ Downloading Cowork demo-pack into $DEST/ ..."
for f in "${FILES[@]}"; do
  curl -fsSL "$BASE/$f" -o "$DEST/$f"
  echo "  ✓ $f"
done

PROMPTS=(
  01-executive-week-ahead.txt 02-margin-leak.txt 03-weekly-1on1-prep.txt
  04-qbr-prep-cross-app.txt 05-product-launch-command-center.txt
  06-sales-performance-cockpit.txt 07-offsite-transcript-to-deck.txt
  08-engagement-survey-to-deck.txt 09-contracts-compare-to-word.txt
  10-financials-to-board-deck.txt 11-email-thread-to-decision.txt
  12-contoso-design-skill.txt 13-teams-executive-update.txt
  14-outlook-customer-follow-up.txt 15-inbox-triage-to-excel.txt
  16-teams-incident-response.txt 17-ap-three-way-invoice-match.txt
)
for lang in de en; do
  mkdir -p "$DEST/prompts/$lang"
  for name in "${PROMPTS[@]}"; do
    curl -fsSL "$BASE/prompts/$lang/$name" -o "$DEST/prompts/$lang/$name"
  done
done

echo
echo "✅ Done. Next: upload the demo files to OneDrive/SharePoint"
echo "   (suggested folder: Microsoft/Copilot-Demos/) so Cowork can reach them."
echo "   Prompts + run book are in $DEST/README.md"
