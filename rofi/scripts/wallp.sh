#!/usr/bin/env bash

# Directories
IMG_DIR="$HOME/Pictures/Wallpapers/$LEX_THEME"
CACHE_DIR="$HOME/.cache/rofi-thumbs"
mkdir -p "$CACHE_DIR"

# 1. Generate thumbnails using ImageMagick if they don't exist
find "$IMG_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
  filename=$(basename "$img")
  thumb="$CACHE_DIR/$filename"

  # Only convert if the thumbnail doesn't exist yet
  if [ ! -f "$thumb" ]; then
    # ImageMagick: Resize to 120px wide/high maximum while preserving aspect ratio
    magick "$img" -thumbnail 120x120 "$thumb"
  fi
done

# 2. Feed the thumbnails into Rofi
selection=$(find "$IMG_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" \) | while read -r img; do
  filename=$(basename "$img")
  thumb="$CACHE_DIR/$filename"
  # Format: Display_Name\0icon\x1fPath_To_Thumbnail
  echo -en "$filename\0icon\x1f$thumb\n"
done | rofi -config ~/.config/rofi/wallp.rasi -dmenu -p "Select : ")

# 3. Do something with the selected image
if [ -n "$selection" ]; then
  echo "Selected: $IMG_DIR/$selection"
  pkill swaybg
  swaybg -i "$IMG_DIR/$selection" -m fill
  cat <<EOF >~/.config/rofi/scripts/wallp.out
  #!/usr/bin/env bash
  swaybg -i "$IMG_DIR/$selection" -m fill
EOF
fi
