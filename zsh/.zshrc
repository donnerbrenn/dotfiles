eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
export EDITOR=nvim
export GCM_CREDENTIAL_STORE=secretservice
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.toml)"
alias ls='exa'
alias fzf='fzf --preview="bat --color=always {}"'
alias fff='find . -type f | fzf --preview "bat --color=always {}"'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
