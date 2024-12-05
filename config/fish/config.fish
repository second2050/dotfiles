# switch to zellij if connected via ssh and interactive
if status is-interactive && set -q SSH_CLIENT && command --query zellij
    set --erase SSH_CLIENT
    set --erase SSH_TTY
    set --erase SSH_CONNECTION
    # if agent forwarding is in use, symlink the SSH_AGENT_SOCK on connection
    # to a known location which can be updated to a new socket on reconnection
    if set -q SSH_AUTH_SOCK
        ln -sf $SSH_AUTH_SOCK $HOME/.ssh/agent.sock
        set SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"
    end
    exec zellij attach --create remote
end

# Keybindings (Konsole/Yakuake)
bind ctrl-h backward-kill-word
bind ctrl-delete kill-word
bind \eOM insert-line-under # shift-enter
bind alt-i __sekii_show_git_status
if command --query run0 # use run0 if it is available
    bind alt-s "fish_commandline_prepend run0"
    bind alt-c "fish_commandline_prepend command"
end

