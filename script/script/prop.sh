#!/bin/bash

# 1. Position holen
pos=$(slurp -p)
[ -z "$pos" ] && exit 1

# 2. Koordinaten extrahieren (" 1x1" entfernen)
coords=$(echo "$pos" | cut -d' ' -f1)
X=$(echo "$coords" | cut -d, -f1)
Y=$(echo "$coords" | cut -d, -f2)

# 3. JSON holen und Adresse suchen
json=$(hyprctl clients -j)
addr=$(echo "$json" | jq -r --argjson x "$X" --argjson y "$Y" \
    '.[] | select(.workspace.id != -1) | select(.at[0] <= $x and .at[0] + .size[0] >= $x and .at[1] <= $y and .at[1] + .size[1] >= $y) | .address' | head -n 1)

# 4. Anzeige
if [ -n "$addr" ]; then
    # Entferne "0x" für den grep-Vergleich
    clean_addr=${addr#0x}

    # Foot öffnen
    foot --title="Client Info" --app-id="foot_float" --hold sh -c "
        if ! hyprctl clients | grep -i -B 2 -A 20 \"$clean_addr\"; then
            # Fallback auf JSON, falls Textsuche fehlschlägt
            echo 'Textsuche fehlgeschlagen. Zeige JSON:'
            echo '$json' | jq '.[] | select(.address == \"$addr\")'
        fi
    "
else
    notify-send "Hyprland" "Kein Fenster gefunden."
fi
