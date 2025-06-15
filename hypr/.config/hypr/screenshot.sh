#!/bin/bash

# Ziel-Datei in Zwischenablage (via wl-copy)
copy_to_clipboard() {
  wl-copy < "$1"
  rm "$1"
}

# Temporäre Datei für Screenshot
tmpfile=$(mktemp --suffix=.png)

case "$1" in
  all)
    grim "$tmpfile"
    copy_to_clipboard "$tmpfile"
    ;;
# window)
#     # Aktives Fenster ermitteln und Screenshot machen
#     # Benötigt `swaymsg`, was unter Hyprland via `hyprctl` ersetzt wird
#     winbox=$(hyprctl activewindow -j | jq -r '.at, .size' | paste -sd " ")
#     read -r x y <<< "$(echo "$winbox" | cut -d' ' -f1,2)"
#     read -r w h <<< "$(echo "$winbox" | cut -d' ' -f3,4)"
#     grim -g "${x},${y} ${w}x${h}" "$tmpfile"
#     copy_to_clipboard "$tmpfile"
#     ;;
  workspace)
    # Bildschirmgröße vom aktuellen Workspace (Monitor) holen
    monbox=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) | .x, .y, .width, .height' | paste -sd " ")
    read -r x y w h <<< "$monbox"
    grim -g "${x},${y} ${w}x${h}" "$tmpfile"
    copy_to_clipboard "$tmpfile"
    ;;
  *)
    echo "Usage: $0 {all|workspace}"
    exit 1
    ;;
esac
