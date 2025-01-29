function fish_right_prompt
    set cmd_status $status
    # show time of command execution if starship is loaded
    if set -q TRANSIENT && test "$RIGHT_TRANSIENT" -eq 1 && set -q STARSHIP_SHELL
        starship module time
    # if starship is not loaded clear right prompt for transience
    else if set -q TRANSIENT && test "$RIGHT_TRANSIENT" -eq 1
        echo ""
    # show incognito indicator in private mode
    else if set -q fish_private_mode
        echo -e "\e[90m(󰗹)\e[0m"
    # show mommy in other cases if available
    else if command -q mommy && ! set -q MOMMY_SLEEP && ! set -q ASCIINEMA_REC
        mommy -1 -s $cmd_status 2> /dev/null
    # show cute kaomojis based on status if mommy is n/a or asleep
    else if test "$cmd_status" -eq 0
        echo -e "\e[90m(>‿◕)~♥\e[0m"
    else
        echo -e "\e[90m(╯°□°)╯︵ ┻━┻\e[0m"
    end
end
