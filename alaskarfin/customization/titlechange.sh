#!/bin/sh
# Set the base directory where Jellyfin's files are located
BASE_DIR="/jellyfin/jellyfin-web"

# Determine the name of this script so we can exclude it
SCRIPT_NAME=$(basename "$0")

# Update document.title to "AlaskarTV" in all relevant files (case‑insensitive),
# excluding this script itself.
grep -rli --exclude="$SCRIPT_NAME" 'document\.title="jellyfin"' "$BASE_DIR" | while IFS= read -r file; do
    echo "Updating document.title in: $file"
    # The 'gI' flags mean global replacement and case‑insensitive matching (GNU sed)
    sed -i 's/document\.title="jellyfin"/document.title="AlaskarTV"/gI' "$file"
done

# Update fallback title (case‑insensitive), again excluding this script.
grep -rli --exclude="$SCRIPT_NAME" 'document.title=e||"jellyfin"' "$BASE_DIR" | while IFS= read -r file; do
    echo "Updating fallback title in: $file"
    sed -i 's/document.title=e||"jellyfin"/document.title=e||"AlaskarTV"/gI' "$file"
done

# Update enableBackdrops function in main.jellyfin.bundle.js
# This changes:
#   enableBackdrops:function(){return _}
# to:
#   enableBackdrops:function(){return E}
FILE="$BASE_DIR/main.jellyfin.bundle.js"
if [ -f "$FILE" ]; then
    echo "Updating enableBackdrops in: $FILE"
    sed -i 's/enableBackdrops:function(){return R}/enableBackdrops:function(){return E}/g' "$FILE"
else
    echo "File $FILE not found."
fi

echo "All document titles and enableBackdrops updated!"

