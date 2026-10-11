#!/usr/bin/env bash

set -euo pipefail

selected="$(
  printf '%s\n' \
    "Gruvbox" \
    "Monochrome" |
    rofi -dmenu -i -p "Select Theme :"
)" || exit 0

[[ -n "$selected" ]] || exit 0

case "$selected" in
Gruvbox) theme="gruvbox" ;;
Monochrome) theme="monochrome" ;;
*) exit 1 ;;
esac

defGruvboxWallp="$HOME/Pictures/Wallpapers/gruvbox/gruvbox1.png"
defMonochromeWallp="$HOME/Pictures/Wallpapers/monochrome/wallhaven-cloud.jpg"

hyprctl eval "hl.env(\"LEX_THEME\", \"$theme\")"

if [[ $theme == "gruvbox" ]]; then
  pkill swaybg
  swaybg -i $defGruvboxWallp -m fill
  cat <<EOF >~/.config/rofi/scripts/wallp.out
  #!/usr/bin/env bash
  swaybg -i "$defGruvboxWallp" -m fill
EOF
fi

if [[ $theme == "monochrome" ]]; then
  pkill swaybg
  swaybg -i "$defMonochromeWallp" -m fill
  cat <<EOF >~/.config/rofi/scripts/wallp.out
  #!/usr/bin/env bash
  swaybg -i "$defMonochromeWallp" -m fill
EOF
fi
