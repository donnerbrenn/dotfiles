
# Funktion zum Neuladen der .zshrc
reload_zshrc() {
  source ~/.zshrc
    print -Pn "\n%F{green}✅ .zshrc neu geladen!%f\n"
    echo "/n"
  zle reset-prompt
}


zle -N reload_zshrc
