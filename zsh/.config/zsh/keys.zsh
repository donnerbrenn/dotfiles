bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^j" backward-word
bindkey "^k" forward-word
bindkey "^[^?" backward-kill-word

bindkey '^X' reload_zshrc
# bindkey -v
bindkey -r '^S'   # blockierende Suche
bindkey -r '^Q'   # push-line (nervig)
bindkey -r '^O'   # accept-line-and-down-history (häufig versehentlich)
bindkey -r '^[q'  # push-line (Alt+q)
