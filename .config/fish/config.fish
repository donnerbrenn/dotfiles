if status is-interactive
    # Commands to run in interactive sessions can go here
end
#starship init fish | source
set -x GCM_CREDENTIAL_STORE secretservice
fish_config theme choose Lava
oh-my-posh init fish --config ~/.config/oh-my-posh/config.toml | source
zoxide init fish | source
