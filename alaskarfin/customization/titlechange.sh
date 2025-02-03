# #!/bin/bash
#
# # Set the base directory where Jellyfin's files are located
# BASE_DIR="/jellyfin/jellyfin-web"
#
# # Update document.title to "AlaskarTV" in all relevant files
# grep -rl 'document\.title="Jellyfin"' "$BASE_DIR" | while read -r file; do
#     sed -i 's/document\.title="Jellyfin"/document\.title="AlaskarTV"/g' "$file"
# done
#
# # Ensure fallback title is also updated to "AlaskarTV"
# grep -rl 'document.title=e||"Jellyfin"' "$BASE_DIR" | while IFS= read -r file; do
#     sed -i 's/document.title=e||"Jellyfin"/document.title=e||"AlaskarTV"/g' "$file"
# done
#
# echo "Document titles updated to 'AlaskarTV' in all files!"

#!/bin/bash

# Set the base directory where Jellyfin's files are located
BASE_DIR="/jellyfin/jellyfin-web"

# Update document.title to "AlaskarTV" in all relevant files (case-insensitive)
grep -rli 'document\.title="jellyfin"' "$BASE_DIR" | while IFS= read -r file; do
    echo "Updating document.title in: $file"
    # The 'gI' flags mean "global" and "case-insensitive"
    sed -i 's/document\.title="jellyfin"/document.title="AlaskarTV"/gI' "$file"
done

# Update fallback title (case-insensitive)
grep -rli 'document.title=e||"jellyfin"' "$BASE_DIR" | while IFS= read -r file; do
    echo "Updating fallback title in: $file"
    sed -i 's/document.title=e||"jellyfin"/document.title=e||"AlaskarTV"/gI' "$file"
done

# Update enableBackdrops function in main.jellyfin.bundle.js
# This will change: enableBackdrops:function(){return _}
# To:         enableBackdrops:function(){return E}
FILE="$BASE_DIR/main.jellyfin.bundle.js"
if [[ -f "$FILE" ]]; then
    echo "Updating enableBackdrops in: $FILE"
    sed -i 's/enableBackdrops:function(){return _}/enableBackdrops:function(){return E}/g' "$FILE"
else
    echo "File $FILE not found."
fi

echo "All document titles and enableBackdrops updated!"

