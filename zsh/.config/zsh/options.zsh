setopt SHARE_HISTORY
setopt correct

export FZF_DEFAULT_OPTS="--layout=reverse --border=bold --border=rounded --margin=1% --color=dark"
export EDITOR=nvim
export GCM_CREDENTIAL_STORE=secretservice

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
# zstyle ':comexport FZF_DEFAULT_OPTS="--layout=reverse --border=bold --border=rounded --margin=1% --color=dark"
