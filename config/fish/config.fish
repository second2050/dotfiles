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

