#!/usr/bin/env bash
WEB_ROOT="/jellyfin/jellyfin-web"

# your custom assets (place them in the same dir for simplicity)
CUSTOM_BANNER="$WEB_ROOT/assets/img/banner-light.png"
CUSTOM_ICON="$WEB_ROOT/assets/icon-transparent.png"
CUSTOM_FAV="$WEB_ROOT/faveicon.ico/favicon.ico"

# overwrite banner-light.*.png
find "$WEB_ROOT" -type f -name "banner-light.*.png" -exec cp -f "$CUSTOM_BANNER" {} \;

# overwrite icon-transparent.*.png
find "$WEB_ROOT" -type f -name "icon-transparent.*.png" -exec cp -f "$CUSTOM_ICON" {} \;

# overwrite favicon.ico (no hash)
cp -f "$CUSTOM_FAV" "$WEB_ROOT/favicon.ico"

echo "✔ Custom assets applied"

