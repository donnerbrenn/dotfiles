
#!/bin/bash

echo "Bitte tippen sie so schnell es ihnen möglich ist 100 Zeichen - Wir messen dann, wieviele WPM sie erreichen,"

# Echo ausschalten
stty -echo

input=""
start_time=$(date +%s.%N)

while IFS= read -r -n1 char; do
    # Enter beendet die Eingabe
    if [[ $char == $'\n' ]]; then
        break
    fi

    # Backspace oder Delete erkannt
    if [[ $char == $'\x7f' || $char == $'\b' ]]; then
        if [ -n "$input" ]; then
            input=${input%?}
            echo -ne "\b \b"
        fi
        continue
    fi

    # Nur druckbare Zeichen erlauben
    if [[ $char =~ [[:print:]] ]]; then
        if [ ${#input} -lt 100 ]; then
            input+="$char"
            echo -n "$char"
        else
            break
        fi
    fi
done

end_time=$(date +%s.%N)

# Echo wieder anschalten
stty echo
echo
echo "Eingabe beendet:"
# echo "$input"

# Zeit berechnen
elapsed=$(echo "scale=2; ($end_time - $start_time)/1" | bc)

# Zeichen pro Minute (CPM) und Words per Minute (WPM) berechnen
cpm=$(echo "scale=2; (${#input} / $elapsed) * 60" | bc)
wpm=$(echo "scale=2; $cpm / 5" | bc)

echo "Dauer: ${elapsed} Sekunden"
echo "Zeichen pro Minute (CPM): $cpm"
echo "Wörter pro Minute (WPM): $wpm"

