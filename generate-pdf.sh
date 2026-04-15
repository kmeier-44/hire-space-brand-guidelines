#!/usr/bin/env bash
# Regenerate the downloadable PDF snapshot of the brand guidelines deck.
# Usage: ./generate-pdf.sh
#
# Requires:
#   - Google Chrome installed at the default macOS path
#   - The preview server running at http://localhost:4567 (start via preview_start in the Claude CLI, or:
#     python3 -m http.server 4567 --directory /Users/kimmeier/Documents/projects/brand-guidelines)

set -euo pipefail

PROJECT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
URL="http://localhost:4567/"
OUT="$PROJECT/hire-space-brand-guidelines.pdf"

if [[ ! -x "$CHROME" ]]; then
  echo "Google Chrome not found at $CHROME" >&2
  exit 1
fi

# Sanity check: is the server up?
if ! curl -sSf -o /dev/null "$URL"; then
  echo "Preview server not reachable at $URL" >&2
  echo "Start it first. In Claude Code: preview_start brand-guidelines." >&2
  echo "Or manually: python3 -m http.server 4567 --directory \"$PROJECT\"" >&2
  exit 1
fi

echo "Generating PDF from $URL ..."
"$CHROME" --headless --disable-gpu \
  --print-to-pdf="$OUT" \
  --no-pdf-header-footer \
  --virtual-time-budget=10000 \
  --run-all-compositor-stages-before-draw \
  "$URL" 2>/dev/null

# Summarise
if command -v pdfinfo >/dev/null 2>&1; then
  PAGES=$(pdfinfo "$OUT" | awk '/^Pages:/{print $2}')
  SIZE=$(pdfinfo "$OUT" | awk '/^Page size:/{print $3, $4, $5, $6, $7}')
  echo "Done: $PAGES pages, page size $SIZE, saved to $OUT"
else
  BYTES=$(stat -f%z "$OUT")
  echo "Done: $BYTES bytes, saved to $OUT"
fi

echo
echo "The Download PDF button in the deck now serves this file."
echo "Re-run this script whenever you change index.html and want the download to match."
