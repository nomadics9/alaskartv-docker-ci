#!/bin/bash

# Path to the config.json file
CONFIG_FILE="/jellyfin/jellyfin-web/config.json"

# Check if the file exists
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: config.json not found at $CONFIG_FILE"
    exit 1
fi

# Define the JSON to be added
NEW_LINKS='
{
    "name": "Requests 🍿",
    "icon": "download",
    "url": "https://r.askar.tv"
},
{
    "name": "Manage Account",
    "icon": "manage_accounts",
    "url": "https://user.askar.tv/my/account"
},
{
    "name": "Developer",
    "icon": "code",
    "url": "https://alaskar.dev"
},
{
    "name": "Server Status",
    "icon": "storage",
    "url": "https://user.askar.tv/my/account"
}'

# Insert the new links into the "menuLinks" array
jq --argjson newLinks "[$NEW_LINKS]" '
  .menuLinks += $newLinks
' "$CONFIG_FILE" > "${CONFIG_FILE}.tmp" && mv "${CONFIG_FILE}.tmp" "$CONFIG_FILE"

echo "Menu links added successfully to config.json!"
