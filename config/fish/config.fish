# load OS specific configuration
if test -x "$__fish_config_dir"/config.(uname -s).fish
    source "$__fish_config_dir"/config.(uname -s).fish
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
if command --query run0 # use run0 if it is available
    bind \es "fish_commandline_prepend run0"
end

# Variables
set --export SHELL (command --search fish)
set --export EDITOR (command --search nvim || command --search vim || command --search vi)
if not set -q XDG_CONFIG_HOME; set --export XDG_CONFIG_HOME "$HOME/.config"; end
if not set -q XDG_CACHE_HOME; set --export XDG_CACHE_HOME "$HOME/.cache"; end
if not set -q XDG_DATA_HOME; set --export XDG_DATA_HOME "$HOME/.local/share"; end
if not set -q XDG_STATE_HOME; set --export XDG_STATE_HOME "$HOME/.local/state"; end
set FISH_FUNCTION_DIR "$__fish_config_dir/functions"

# Source additional config files from conf.d
for file in (ls "$__fish_config_dir/conf.d")
    source "$__fish_config_dir/conf.d/$file"
end

