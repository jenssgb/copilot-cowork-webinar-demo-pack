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
  README.md
)

mkdir -p "$DEST"
echo "→ Downloading Cowork demo-pack into $DEST/ ..."
for f in "${FILES[@]}"; do
  curl -fsSL "$BASE/$f" -o "$DEST/$f"
  echo "  ✓ $f"
done

echo
echo "✅ Done. Next: upload the four .xlsx files to OneDrive/SharePoint"
echo "   (suggested folder: Microsoft/Copilot-Demos/) so Cowork can reach them."
echo "   Prompts + run book are in $DEST/README.md"
