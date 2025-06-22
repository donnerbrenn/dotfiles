
alias v='nvim'
alias w='curl wttr.in'
alias ffxiv='cd ~/Developement/FFXIV && ./create.py'
alias asap='cd ~/Developement/asap && ./create.py'
alias y='yay'
alias off='systemctl poweroff'
alias reboot='systemctl reboot'
alias l='exa --icons -l'
alias ls='exa --icons'
alias la='exa --icons -la'
alias lh='exa --icons -lah'
alias ff='fzf --preview="bat --color=always {}"'
alias fff='find . -type f | fzf --preview "bat --color=always {}"'
alias b='time cat ~/bible.txt'
alias man='batman'
alias tteasy='tt -words ~/tt/wortliste-easy.txt'
alias tthard='tt -words ~/tt/wortliste-hard.txt'
alias ttrare='tt -words ~/tt/wortliste-rare.txt'
alias ttrt='tt -words ~/tt/wortliste-rtui.txt'
alias please='sudo $(fc -ln -1)'
alias ccleaner='sudo paccache -r && yay -Sc --noconfirm'
alias pacc='sudo pacman -Rns $(pacman -Qdtq)'
alias sysf='systemctl list-units --type=service --all | fzf | awk '{print $1}' | xargs -r systemctl restart'
alias jcf=' journalctl --no-pager -o short-iso | fzf --ansi --reverse'
alias yaya="yay -Sl | awk '\$1 == \"aur\" { print \$2 \"\t\" \$1 }' | sort | fzf --multi --with-nth=1 --preview 'yay -Si {1}' --preview-window=right:85% | awk '{print \$1}' | xargs -ro yay -S"

alias yayf="yay -Sl | awk '
  \$1 == \"cachyos-znver4\" { seen[\$2] = \$1 }
  !(\$2 in seen) { seen[\$2] = \$1 }
  END { for (pkg in seen) printf \"%s\t%s\n\", pkg, seen[pkg] }
' | sort | fzf --multi --with-nth=1 --preview 'yay -Si {1}' --preview-window=right:75% | awk '{print \$1}' | xargs -ro yay -S"
# alias pacf="pacman -Sl | fzf --multi --preview 'pacman -Sii {2}' --preview-window=right:50% | awk '{print \$2}' | xargs -ro sudo pacman -S"

alias pacf="pacman -Sl | awk '
  \$1 == \"cachyos-znver4\" { seen[\$2] = \$1 }
  !(\$2 in seen) { seen[\$2] = \$1 }
  END { for (pkg in seen) printf \"%s\t%s\n\", pkg, seen[pkg] }
' | sort | fzf --multi --with-nth=1 --preview 'pacman -Sii {1}' --preview-window=right:75% | awk '{print \$1}' | xargs -ro sudo pacman -S"

alias pacli='pacman -Qq | fzf --preview "echo \"--- Paketinfo ---\" && pacman -Qi {} && echo && echo \"--- Dateien ---\" && pacman -Ql {} | head -40" --preview-window=right:85%'
