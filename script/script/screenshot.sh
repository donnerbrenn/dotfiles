#!/bin/env bash

# Abhängigkeiten prüfen
for cmd in grim slurp wl-copy hyprctl jq notify-send satty; do
    if ! command -v $cmd &> /dev/null; then
        notify-send "Screenshot Script" "Fehler: $cmd ist nicht installiert."
        exit 1
    fi
done

MODE="direct"
[ "$2" == "edit" ] && MODE="edit"

finalize_screenshot() {
    local file=$1
    local mode_name=$2

    if [ -f "$file" ]; then
        if [ "$MODE" == "edit" ]; then
            # Wir nutzen den absoluten Pfad für die Config
            local config_path="$HOME/.config/satty/config.toml"

            # Satty starten. WICHTIG: Wir warten, bis Satty fertig ist.
            if [ -f "$config_path" ]; then
                satty --filename "$file" --output-filename "$file" --config "$config_path"
            else
                # Fallback, falls die Config-Datei fehlt
                satty --filename "$file" --output-filename "$file"
            fi

            # Prüfen, ob Satty gespeichert hat (Datei-Zeitstempel hat sich geändert oder Datei existiert noch)
            # Wenn Satty mit ESC beendet wird, löschen wir und brechen ab.
            if [ ! -s "$file" ]; then
                rm -f "$file"
                exit 0
            fi

            wl-copy < "$file"
            notify-send -a "Screenshot" -i "$file" "Bearbeitet & Kopiert" "Dein Screenshot ist bereit."
        else
            wl-copy < "$file"
            notify-send -a "Screenshot" -i "$file" "Screenshot erstellt" "Modus: $mode_name\nIn die Zwischenablage kopiert."
        fi

        (sleep 2 && rm -f "$file") &
    else
        exit 1
    fi
}

tmpfile=$(mktemp --suffix=.png)

case "$1" in
    all)
        grim "$tmpfile"
        finalize_screenshot "$tmpfile" "Gesamter Desktop"
        ;;
    window)
        window_geo=$(hyprctl activewindow -j | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        [ "$window_geo" == "," ] && { rm "$tmpfile"; exit 1; }
        grim -g "$window_geo" "$tmpfile"
        finalize_screenshot "$tmpfile" "Aktives Fenster"
        ;;
    area)
        area=$(slurp -b "#45858866" -c "#83a598ff" -s "#00000000")
        if [ -z "$area" ]; then
            rm "$tmpfile"
            exit 1
        fi
        grim -g "$area" "$tmpfile"
        finalize_screenshot "$tmpfile" "Bereichsauswahl"
        ;;
    workspace)
        mon_geo=$(hyprctl monitors -j | jq -r '.[] | select(.focused==true) | "\(.x),\(.y) \(.width)x\(.height)"')
        grim -g "$mon_geo" "$tmpfile"
        finalize_screenshot "$tmpfile" "Monitor/Workspace"
        ;;
    *)
        echo "Usage: $0 {all|window|area|workspace} [edit]"
        rm "$tmpfile"
        exit 1
        ;;
esac
