export EDITOR=nvim
export GCM_CREDENTIAL_STORE=secretservice
eval "$(oh-my-posh init zsh --config ~/.config/oh-my-posh/config.toml)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
