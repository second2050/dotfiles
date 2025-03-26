# Variables
set --export SHELL (command --search fish)
set --export EDITOR (command --search nvim || command --search vim || command --search vi)
if not set -q XDG_CONFIG_HOME; set --export XDG_CONFIG_HOME "$HOME/.config"; end
if not set -q XDG_CACHE_HOME; set --export XDG_CACHE_HOME "$HOME/.cache"; end
if not set -q XDG_DATA_HOME; set --export XDG_DATA_HOME "$HOME/.local/share"; end
if not set -q XDG_STATE_HOME; set --export XDG_STATE_HOME "$HOME/.local/state"; end
set FISH_FUNCTION_DIR "$__fish_config_dir/functions"

## Less options
set --local less_promptM '?f%f .?n?m(%T %i of %m) ..?ltlines %lt-%lb?L/%L. :byte %bB?s/%s. .?e(END) ?x- Next\: %x.:?pB%pB\%..%t (press h for help or q to quit)'
set --export LESS "-RSMPM$less_promptM\$ --mouse --file-size"
set --export LESS_TERMCAP_mb (set_color -o red)
set --export LESS_TERMCAP_md (set_color -o blue)
set --export LESS_TERMCAP_me (printf "\e[0m")
set --export LESS_TERMCAP_so (set_color green)
set --export LESS_TERMCAP_se (printf "\e[0m")
set --export LESS_TERMCAP_us (set_color -u magenta)
set --export LESS_TERMCAP_ue (printf "\e[0m")
if command --query bat; set --export LESSOPEN '|bat --color always %s'; end
