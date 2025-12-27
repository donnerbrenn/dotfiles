alias v='nvim' #start nvim
alias lsblk='lsblk -o NAME,UUID,FSTYPE,SIZE,MOUNTPOINT | bat -l conf -p' #make lsblk more verbose and useful
alias ccat='column -t -s,' #Display csvs properly
alias w='curl wttr.in' #show weather
alias ffxiv='cd ~/Developement/FFXIV && ./create.py' #fetch ffxiv stats
alias asap='cd ~/Developement/asap && ./create.py' #fetch asap stats
alias y='yay' #call yay
alias pts='phoronix-test-suite benchmark' #call phoronix-test-suite
alias ptsl='phoronix-test-suite list-available-tests' #list phoronix-test-suite tests
alias ptsf='phoronix-test-suite list-available-tests | grep' #find phoronix-test-suite tests
alias pts1='FORCE_TIMES_TO_RUN=1 phoronix-test-suite benchmark' #call phoronix-test-suite with a single run
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
alias b='time cat ~/Dokumente/bible.txt' #benchmark terminal with the full bible
alias man='batman' #replace man by batman
alias tteasy='tt -words ~/tt/wortliste-easy.txt' #start a typing test with easy words
alias tthard='tt -words ~/tt/wortliste-hard.txt' #start a typing test with hard words
alias ttrare='tt -words ~/tt/wortliste-rare.txt' #start a typing test with rare letter words
alias ttrt='tt -words ~/tt/wortliste-rtui.txt' #start a typing test with r/t/u/i letter words
alias ttio='tt -words ~/tt/wortliste-io.txt' #start a typing test with r/t/u/i letter words
alias please='sudo $(fc -ln -1)' #rerun the last command with sudo
alias ccleaner='sudo paccache -r && yay -Sc --noconfirm' #purge pacman and yay caches
alias pacc='sudo pacman -Rns $(pacman -Qdtq)' #remove orphaned packages
alias sysf='systemctl list-units --type=service --all | fzf | awk '{print $1}' | xargs -r systemctl restart' #find an (re)start services
alias jcf=' journalctl --no-pager -o short-iso | fzf --ansi --reverse' #search through the system journal
alias :qa='exit' #exit shell, like we are in vim
alias :qa!='exit' #exit shell, like we are in vim
alias yaya="yay -Sl | awk '\$1 == \"aur\" { print \$2 \"\t\" \$1 }' | sort | fzf --multi --with-nth=1 --preview 'yay -Si {1}' --preview-window=right:85% | awk '{print \$1}' | xargs -ro yay -S" #install packages from AUR
alias sreboot="systemctl soft-reboot" #Softreboot shortcut
alias yayf="yay -Sl | awk ' \$1 == \"cachyos-znver4\" { seen[\$2] = \$1 } !(\$2 in seen) { seen[\$2] = \$1 } END { for (pkg in seen) printf \"%s\t%s\n\", pkg, seen[pkg] } ' | sort | fzf --multi --with-nth=1 --preview 'yay -Si {1}' --preview-window=right:85% | awk '{print \$1}' | xargs -ro yay -S" #search packages via yay

alias pacf="pacman -Sl | awk ' \$1 == \"cachyos-znver4\" { seen[\$2] = \$1 } !(\$2 in seen) { seen[\$2] = \$1 } END { for (pkg in seen) printf \"%s\t%s\n\", pkg, seen[pkg] } ' | sort | fzf --multi --with-nth=1 --preview 'pacman -Sii {1}' --preview-window=right:85% | awk '{print \$1}' | xargs -ro sudo pacman -S" #search packages via pacman

alias pacli='pacman -Qq | fzf --preview "echo \"--- Paketinfo ---\" && pacman -Qi {} && echo && echo \"--- Dateien ---\" && pacman -Ql {} | head -40" --preview-window=right:85%' #search through installed packages
alias update='sudo pacman -Syyu' #update via pacman
alias sshfs='sshfs -o reconnect -o compression=no -o Cipher=chacha20-poly1305@openssh.com -o cache=yes -o kernel_cache -o ServerAliveInterval=15 -o ServerAliveCountMax=3' #more performance for sshfs
alias spot="ncmpcpp -p 6601" #Start ncmpcpp and connect it to mopidy on port 6601
se() { find -L ~/dotfiles -type f |  fzf --multi --preview 'bat --style=numbers --color=always --line-range :500 {}'  --preview-window=right:50% |  xargs -r $EDITOR }
sn() { find -L ~/.config/nvim/ -type f |  fzf --multi --preview 'bat --style=numbers --color=always --line-range :500 {}'  --preview-window=right:50% |  xargs -r $EDITOR }
vf() {fzf | xargs -r -I % $EDITOR % ;}
