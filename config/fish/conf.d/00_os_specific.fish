# load OS specific configuration
if test -x "$__fish_config_dir"/config.(uname -s).fish
    source "$__fish_config_dir"/config.(uname -s).fish
end

