alias v='nvim' #start nvim
alias w='curl wttr.in' #show weather
alias ffxiv='cd ~/Developement/FFXIV && ./create.py' #fetch ffxiv stats
alias asap='cd ~/Developement/asap && ./create.py' #fetch asap stats
alias y='yay' #call yay
alias ga='git add' #git add
alias gc='git commit -m' #git commit -m
alias gf='git pull' #git pull
alias gp='git push' #git push
alias off='systemctl poweroff' #turn off computer
alias reboot='systemctl reboot' #reboot computer
alias l='eza --icons -l' #shortcut for eza
alias ls='eza --icons' #replace ls by eza
alias la='eza --icons -la' #long eza
alias lh='eza --icons -lah' #long eza with hidden files
alias ff='fzf --preview="bat --color=always {}"' #find a file or directory
alias fff='find . -type f | fzf --preview "bat --color=always {}"' #find a file
alias b='time cat ~/bible.txt' #benchmark terminal with the full bible
alias man='batman' #replace man by batman
alias tteasy='tt -words ~/tt/wortliste-easy.txt' #start a typing test with easy words
alias tthard='tt -words ~/tt/wortliste-hard.txt' #start a typing test with hard words
alias ttrare='tt -words ~/tt/wortliste-rare.txt' #start a typing test with rare letter words
alias ttrt='tt -words ~/tt/wortliste-rtui.txt' #start a typing test with r/t/u/i letter words
alias please='sudo $(fc -ln -1)' #rerun the last command with sudo
alias ccleaner='sudo paccache -r && yay -Sc --noconfirm' #purge pacman and yay caches
alias pacc='sudo pacman -Rns $(pacman -Qdtq)' #remove orphaned packages
alias sysf='systemctl list-units --type=service --all | fzf | awk '{print $1}' | xargs -r systemctl restart' #find an (re)start services
alias jcf=' journalctl --no-pager -o short-iso | fzf --ansi --reverse' #search through the system journal
alias :qa='exit' #exit shell, like we are in vim
alias yaya="yay -Sl | awk '\$1 == \"aur\" { print \$2 \"\t\" \$1 }' | sort | fzf --multi --with-nth=1 --preview 'yay -Si {1}' --preview-window=right:85% | awk '{print \$1}' | xargs -ro yay -S" #install packages from AUR

alias yayf="yay -Sl | awk ' \$1 == \"cachyos-znver4\" { seen[\$2] = \$1 } !(\$2 in seen) { seen[\$2] = \$1 } END { for (pkg in seen) printf \"%s\t%s\n\", pkg, seen[pkg] } ' | sort | fzf --multi --with-nth=1 --preview 'yay -Si {1}' --preview-window=right:85% | awk '{print \$1}' | xargs -ro yay -S" #search packages via yay

alias pacf="pacman -Sl | awk ' \$1 == \"cachyos-znver4\" { seen[\$2] = \$1 } !(\$2 in seen) { seen[\$2] = \$1 } END { for (pkg in seen) printf \"%s\t%s\n\", pkg, seen[pkg] } ' | sort | fzf --multi --with-nth=1 --preview 'pacman -Sii {1}' --preview-window=right:85% | awk '{print \$1}' | xargs -ro sudo pacman -S" #search packages via pacman

alias pacli='pacman -Qq | fzf --preview "echo \"--- Paketinfo ---\" && pacman -Qi {} && echo && echo \"--- Dateien ---\" && pacman -Ql {} | head -40" --preview-window=right:85%' #search through installed packages
