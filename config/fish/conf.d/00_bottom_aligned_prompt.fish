# skip if tput is unavailable
if not command --query tput
    return
end

# Move Prompt to bottom of the terminal
tput cup $COLUMNS 0
function clear --wraps clear
    command clear $argv
    tput cup $COLUMNS 0
end

# make ctrl-l keep the prompt at the bottom
bind ctrl-l "clear -x" repaint

