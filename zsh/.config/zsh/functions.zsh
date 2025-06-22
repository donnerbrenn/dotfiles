
# Funktion zum Neuladen der .zshrc
reload_zshrc() {
  source ~/.zshrc
    print -Pn "\n%F{green}✅ .zshrc neu geladen!%f\n"
    echo "/n"
  zle reset-prompt
}

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
