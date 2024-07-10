if status is-interactive
    # Commands to run in interactive sessions can go here
end
#starship init fish | source
set -x GCM_CREDENTIAL_STORE secretservice
set -x EDITOR nvim
fish_config theme choose Lava
oh-my-posh init fish --config ~/.config/oh-my-posh/config.toml | source
fzf --fish | source
zoxide init fish | source
