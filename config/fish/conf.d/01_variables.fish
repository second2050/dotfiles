# Variables
set --export SHELL (command --search fish)
set --export EDITOR (command --search nvim || command --search vim || command --search vi)
if not set -q XDG_CONFIG_HOME; set --export XDG_CONFIG_HOME "$HOME/.config"; end
if not set -q XDG_CACHE_HOME; set --export XDG_CACHE_HOME "$HOME/.cache"; end
if not set -q XDG_DATA_HOME; set --export XDG_DATA_HOME "$HOME/.local/share"; end
if not set -q XDG_STATE_HOME; set --export XDG_STATE_HOME "$HOME/.local/state"; end
set FISH_FUNCTION_DIR "$__fish_config_dir/functions"

