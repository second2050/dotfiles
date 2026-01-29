function fish_right_prompt
    set cmd_status $status
    set transient

    # check if prompt is actually in a transient state
    if not test "$argv[1]" = "--final-rendering"
        set -e transient
    end

    # show time of command execution if starship is loaded
    if set -q transient && set -q STARSHIP_SHELL
        starship module time
    # if starship is not loaded clear right prompt for transience
    else if set -q transient
        echo ""
    # show incognito indicator in private mode
    else if set -q fish_private_mode
        echo -e "\e[90m(󰗹)\e[0m"
    # show mommy in other cases if available
    else if command -q mommy
        echo -e "\e[90m$(mommy -1 -s $cmd_status 2> /dev/null)\e[0m"
    # show cute kaomojis based on status if mommy is n/a or asleep
    else if test "$cmd_status" -eq 0
        echo -e "\e[90m(>‿◕)~♥\e[0m"
    else
        echo -e "\e[90m(╯°□°)╯︵ ┻━┻\e[0m"
    end
end
