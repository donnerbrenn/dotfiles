# Zinit auto-install, falls nicht vorhanden
if [[ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    mkdir -p "${HOME}/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit.git "${HOME}/.local/share/zinit/zinit.git"

fi
export ZSH_CACHE_DIR="${XDG_CACHE_HOME:-$HOME/.cache}/zinit"
export ZPFX="${HOME}/.local/share/zinit/polaris"

# Zinit laden
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
zinit load hlissner/zsh-autopair
zinit load zsh-users/zsh-autosuggestions
autoload -Uz compinit
compinit

zinit load Aloxaf/fzf-tab
zinit load zsh-users/zsh-syntax-highlighting
export FZF_COMPLETION_OPTS='--height 80% --layout=reverse --border'
export FZF_COMPLETION_TRIGGER='**'
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf --preview 'eza --tree --color=always --icons {} | head -200'   "$@" ;;
        export|unset) fzf --preview "eval 'echo \$'{}"         "$@" ;;
        ssh)          fzf --preview 'dig {}'                   "$@" ;;
        *)            fzf --preview 'bat -n --color=always {}' "$@" ;;
    esac
}
