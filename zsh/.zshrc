eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
export LIBVA_DRIVER_NAME=radeonsi
export EDITOR=nvim
export FZF_DEFAULT_OPTS="--layout=reverse --border=bold --border=rounded --margin=1% --color=dark"
export GCM_CREDENTIAL_STORE=secretservice
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.toml)"
alias n='nvim'
alias ffxiv='cd ~/Developement/FFXIV && ./create.py'
alias asap='cd ~/Developement/asap && ./create.py'
alias y='yay'
alias off='systemctl poweroff'
alias reboot='systemctl reboot'
alias l='exa --icons -l'
alias ls='exa --icons'
alias la='exa --icons -la'
alias lh='exa --icons -lah'
alias fzf='fzf --preview="bat --color=always {}"'
alias fff='find . -type f | fzf --preview "bat --color=always {}"'
alias b='time cat ~/bible.txt'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
