

# Prüft, ob das genannte Paket installiert ist und installiert es bei Bedarf nach.
ensure_pkg_installed() {
    local missing_pkgs=()

    for pkg in "$@"; do
        if pacman -Q "$pkg" &>/dev/null; then
        else
            echo "📦 '$pkg' ist nicht installiert."
            missing_pkgs+=("$pkg")
        fi
    done

    if (( ${#missing_pkgs[@]} > 0 )); then
        echo "🚀 Installation wird gestartet für: ${missing_pkgs[*]}"
        sudo pacman -S --noconfirm "${missing_pkgs[@]}" || echo "❌ Fehler bei der Installation von: ${missing_pkgs[*]}"
    else
    fi
}

# Funktion zum Neuladen der .zshrc
reload_zshrc() {
    source ~/.zshrc
    print -Pn "\n%F{green}✅ .zshrc neu geladen!%f\n"
    echo "/n"
    zle reset-prompt
}

#Listet alle verfügbaren aliase auf
aliases() {
    local file=~/.config/zsh/aliases.zsh
    local selected_line alias_name

    selected_line=$(awk -F'#' '
      /^alias / {
        split($1, a, " ")
        split(a[2], b, "=")
        name = b[1]
        desc = $2
        # Tab oder spaces zum besseren Layout
        printf "%-20s # %s\n", name, desc
      }
    ' "$file" | fzf --ansi --preview "grep -E '^alias {1}' $file")

    # Nur den Alias-Namen extrahieren (vor dem #)
    alias_name=$(echo "$selected_line" | awk '{print $1}')

    if [[ -n $alias_name ]]; then
        # eval alias ausführen
        eval "$alias_name"
    fi
}

zle -N reload_zshrc
zle -N aliases
