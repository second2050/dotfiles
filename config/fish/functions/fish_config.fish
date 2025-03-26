source "$__fish_data_dir/functions/fish_config.fish"
functions --copy fish_config fish_config_internal
function fish_config --description "Open the shell configuration"
    if test -n "$argv"
        fish_config_internal $argv
    else
        pushd $__fish_config_dir
        $EDITOR
        popd
    end
end

