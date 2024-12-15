#!/bin/bash

# Path to the index.html file inside the container
INDEX_HTML_PATH="/jellyfin/jellyfin-web/index.html"

# Debugging: Check if the file exists
if [ ! -f "$INDEX_HTML_PATH" ]; then
    echo "Error: index.html not found at $INDEX_HTML_PATH"
    exit 1
fi

# Update the manifest link
sed -i 's|<link rel="manifest" href="[^"]*">|<link rel="manifest" href="manifest.json">|' "$INDEX_HTML_PATH"

# Update the apple-touch-icon link (if it exists in the file)
sed -i 's|<link rel="apple-touch-icon" sizes="180x180" href="[^"]*">|<link rel="apple-touch-icon" sizes="180x180" href="images/icons/icon-512x512.png">|' "$INDEX_HTML_PATH"

# Debugging: Display a message if the updates were successful
if grep -q '<link rel="manifest" href="manifest.json">' "$INDEX_HTML_PATH"; then
    echo "Manifest link updated successfully."
else
    echo "Error: Manifest link update failed."
fi

if grep -q '<link rel="apple-touch-icon" sizes="180x180" href="images/icons/icon-512x512.png">' "$INDEX_HTML_PATH"; then
    echo "Apple-touch-icon link updated successfully."
else
    echo "Note: Apple-touch-icon link not found or updated."
fi

