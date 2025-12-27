#!/usr/bin/env bash
LAST_ID=""
LAST_STATE=""
while true; do
    mpc idle player > /dev/null
    CURRENT_STATUS=$(mpc status %state%)
    CURRENT_ID=$(mpc current -f "%id%")
    if [[ "$CURRENT_STATUS" == "playing" ]]; then
        if [[ "$CURRENT_ID" != "$LAST_ID" ]] || [[ "$LAST_STATE" != "playing" ]]; then

            LAST_ID="$CURRENT_ID"

            FILE=$(mpc current -f "%file%")
            TIME=$(mpc current -f "%time%")
            TITLE=$(mpc current -f "%title%")
            ARTIST=$(mpc current -f "%artist%")
            ALBUM=$(mpc current -f "%album%")
            mpc readpicture "$FILE" > /tmp/mpd_cover.jpg
            if [ -s /tmp/mpd_cover.jpg ]; then
                notify-send -a "Now playing" -t 3000 -i /tmp/mpd_cover.jpg "$TITLE - $TIME" "$ARTIST\n$ALBUM"
                rm /tmp/mpd_cover.jpg
            else
                notify-send -a "Now playing" -t 3000 "$TITLE" "$ARTIST\n$ALBUM"
            fi
        fi
    fi
    LAST_STATE="$CURRENT_STATUS"
done
