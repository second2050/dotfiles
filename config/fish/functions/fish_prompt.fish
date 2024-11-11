# second2050's simple prompt
function fish_prompt --description 'Write out the prompt'
    set -l last_status $status

    # Seperator Line from last line
    echo

    # User
    set_color -o white
    echo -n $USER

    # Seperator
    set_color normal
    set_color red
    echo -n '@'

    # Host
    set_color -o white
    echo -n (prompt_hostname)
    set_color normal

    echo -n ' '

    # PWD
    set_color $fish_color_cwd
    echo -n (prompt_pwd)
    set_color normal

    fish_git_prompt
    fish_hg_prompt
    echo

    if not test $last_status -eq 0
        set_color $fish_color_error
    end

    echo -n '> '
    set_color normal
end

