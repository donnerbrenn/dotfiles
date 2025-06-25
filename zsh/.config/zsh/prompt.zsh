
# Voraussetzung: Nerd Fonts installiert und Terminal unterstützt Icons

autoload -Uz vcs_info  # Für Git-Status

# Git-Status-Funktion (vereinfacht)
function git_prompt_info() {
    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n $branch ]]; then
        local dirty=""
        # Prüfe Änderungen
        if ! git diff --quiet 2>/dev/null || ! git diff --cached --quiet 2>/dev/null; then
            dirty="*"
        fi
        echo " ${branch}${dirty}"  # Git-Icon + Branch + Status
    fi
}

# Kürze Pfad auf ~ und max 2 Verzeichnisse
function short_cwd() {
    local dir=${PWD/#$HOME/~}
    local parts=("${(@s:/:)dir}")
    if (( ${#parts[@]} > 3 )); then
        echo ".../${parts[-2]}/${parts[-1]}"
    else
        echo $dir
    fi
}

# Farben definieren (ANSI)
local RED='196'
local GREEN='46'
local YELLOW='214'
local BLUE='45'
local CYAN='37'
local WHITE='255'

# Transient Prompt Setup
setopt prompt_subst
setopt transient_rprompt  # die rechte Prompt-Zeile wird transient

# make the prompt red, if we are root
if [[ $EUID -eq 0 ]]; then
    USER_HOST_COLOR=$RED
else
    USER_HOST_COLOR=$GREEN
fi

# Dirty-Status anzeigen, wenn nötig
function git_dirty() {
    git rev-parse --is-inside-work-tree &>/dev/null || return
    [[ -n $(git status --porcelain 2>/dev/null) ]] && echo "*" || echo ""
}

# Prompt definieren
#
PROMPT=$'%F{$USER_HOST_COLOR}╭%n@%m%f %F{$BLUE}$(short_cwd)%f $(git_prompt) '
# PROMPT=$'%F{$USER_HOST_COLOR}╭%n@%m%f %F{$BLUE}$(short_cwd)%f '
PROMPT+=$'%F{$YELLOW}$(git_prompt_info)%f\n'  # Git-Info in neuer Zeile
RPROMPT=$'%F{$WHITE}󰥔 %*%f'  # Uhr-Icon + 24h Zeit
PROMPT+=$'%F{$USER_HOST_COLOR}╰ %f'

# Optional: zsh-syntax-highlighting und autosuggestions für nicer UX
# (wenn nicht installiert, einfach weglassen)
if type zsh-syntax-highlighting &>/dev/null; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if type zsh-autosuggestions &>/dev/null; then
    source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
