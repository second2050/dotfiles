if test (uname -s) = "Darwin" && test -x /opt/homebrew/bin/brew
    /opt/homebrew/bin/brew shellenv | source
end

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
bind \ch backward-kill-word # Kill left Word with CTRL+BACKSPACE
bind \e\[3\;5~ kill-word    # Kill right Word with CTRL+DELETE
bind \eOM insert-line-under # New line with SHIFT+ENTER
bind \ei __sekii_show_git_status

# Variables
set --export SHELL (command --search fish)
set --export EDITOR (command --search nvim || command --search vim || command --search vi)
if not set -q XDG_CONFIG_HOME; set --export XDG_CONFIG_HOME "$HOME/.config"; end
if not set -q XDG_CACHE_HOME; set --export XDG_CACHE_HOME "$HOME/.cache"; end
if not set -q XDG_DATA_HOME; set --export XDG_DATA_HOME "$HOME/.local/share"; end
if not set -q XDG_STATE_HOME; set --export XDG_STATE_HOME "$HOME/.local/state"; end
set FISH_FUNCTION_DIR "$__fish_config_dir/functions"

# Load Starship Prompt if available
if command --query starship
    starship init fish | source
    # overwrite starship's right prompt if available
    if test -e "$FISH_FUNCTION_DIR/fish_right_prompt.fish"
        source "$FISH_FUNCTION_DIR/fish_right_prompt.fish"
    end
    enable_transience
else
    echo ":: [starship] not available, falling back to simple prompt"
end

# include direnv if available
if command --query direnv
    direnv hook fish | source
end

# show short system overview when recording with asciinema (if neofetch is available)
if set -q ASCIINEMA_REC && test "$ASCIINEMA_REC" -eq 1 && command --query neofetch
    neofetch --no_config --ascii_distro arch_small \
        --disable term theme icons cpu gpu memory packages wm de \
                  wm_theme uptime model resolution cols
end

