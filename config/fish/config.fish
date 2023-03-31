# start ZelliJ if started as login-shell
if status is-login
    if set -q ZELLIJ || set -q TMUX # do not nest multiplexers
    else
        set ZJ_SESSIONS (zellij list-sessions 2> /dev/null | string split "\n")
        set NO_SESSIONS (echo $ZJ_SESSIONS | wc -w)

        if test $NO_SESSIONS -ge 2
            exec zellij attach (echo $ZJ_SESSIONS | string split " " | fzf)
        else
            exec zellij attach --create
        end
    end
end

# Override fish config
#set -g fish_prompt_pwd_dir_length 80

# Set SHELL to fish
export SHELL=/usr/bin/fish

# Keybindings (Konsole/Yakuake)
bind \ch backward-kill-word # Kill left Word with CTRL+BACKSPACE
bind \e\[3\;5~ kill-word    # Kill right Word with CTRL+DELETE

# Variables
export EDITOR=/usr/bin/vim

# Load Starship Prompt
starship init fish | source
enable_transience

