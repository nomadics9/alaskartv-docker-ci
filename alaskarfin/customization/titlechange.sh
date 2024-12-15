#!/bin/bash

# Set the base directory where Jellyfin's files are located
BASE_DIR="/jellyfin/jellyfin-web"

# Update document.title to "AlaskarTV" in all relevant files
grep -rl 'document\.title="Jellyfin"' "$BASE_DIR" | while read -r file; do
    sed -i 's/document\.title="Jellyfin"/document\.title="AlaskarTV"/g' "$file"
done

# Ensure fallback title is also updated to "AlaskarTV"
grep -rl 'document.title=e||"Jellyfin"' "$BASE_DIR" | while IFS= read -r file; do
    sed -i 's/document.title=e||"Jellyfin"/document.title=e||"AlaskarTV"/g' "$file"
done

echo "Document titles updated to 'AlaskarTV' in all files!"

