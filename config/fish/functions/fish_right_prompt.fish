function fish_right_prompt
    set cmd_status $status
    # show time of command execution if starship is loaded
    if set -q TRANSIENT && test "$TRANSIENT" -eq 1 && set -q STARSHIP_SHELL
        starship module time
    # if starship is not loaded clear right prompt for transience
    else if set -q TRANSIENT && test "$TRANSIENT" -eq 1
        echo ""
    # show mommy in other cases if available
    else if command -q mommy && ! set -q ASCIINEMA_REC
        mommy -1 -s $cmd_status 2> /dev/null
    end
end
