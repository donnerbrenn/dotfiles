# Zinit auto-install, falls nicht vorhanden
if [[ ! -f "${HOME}/.local/share/zinit/zinit.git/zinit.zsh" ]]; then
    mkdir -p "${HOME}/.local/share/zinit"
    git clone https://github.com/zdharma-continuum/zinit.git "${HOME}/.local/share/zinit/zinit.git"
fi

# Zinit laden
source "${HOME}/.local/share/zinit/zinit.git/zinit.zsh"
zinit load hlissner/zsh-autopair
zinit load zsh-users/zsh-autosuggestions
autoload -Uz compinit
compinit

zinit load Aloxaf/fzf-tab
zinit load zsh-users/zsh-syntax-highlighting


#
#
# plugins=(
#     git                         # Standard‑Git‑Aliaspaket
#     fzf                         # fuzzy finder in $PATH
#     zsh-autosuggestions         # Tipp‑Vervollständigung aus History
#     zsh-syntax-highlighting     # farbige Syntax während des Tippens
# )
