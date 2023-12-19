# switch to zellij if connected via ssh and interactive
if status is-interactive && set -q SSH_CLIENT && which zellij
    set --erase SSH_CLIENT
    set --erase SSH_TTY
    set --erase SSH_CONNECTION
    # if agent forwarding is in use, symlink the SSH_AGENT_SOCK on connection
    # to a known location which can be updated to a new socket on reconnection
    if set -q SSH_AUTH_SOCK
        ln -sf $SSH_AUTH_SOCK $HOME/.ssh/agent.sock
        set SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"
    end
    exec zellij attach --create
end

# Keybindings (Konsole/Yakuake)
bind \ch backward-kill-word # Kill left Word with CTRL+BACKSPACE
bind \e\[3\;5~ kill-word    # Kill right Word with CTRL+DELETE

# Variables
export SHELL=(which fish)
export EDITOR=(which vim 2> /dev/null)

# Load Starship Prompt if available
if which starship &> /dev/null
    starship init fish | source
    enable_transience
else
    echo ":: [starship] not available, falling back to simple prompt"
end

# include direnv if available
if which direnv &> /dev/null
    direnv hook fish | source
end

# show short system overview when recording with asciinema (if neofetch is available)
if set -q ASCIINEMA_REC && test "$ASCIINEMA_REC" -eq 1 && which neofetch &> /dev/null
    neofetch --no_config --ascii_distro arch_small \
        --disable term theme icons cpu gpu memory packages wm de \
                  wm_theme uptime model resolution cols
end

