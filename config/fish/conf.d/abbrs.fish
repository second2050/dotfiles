# this is only relevant for interactive usage
if not status is-interactive
    return
end

# abbreviations:
abbr cmd command
if command --query nmcli
    abbr nmup nmcli connection up
    abbr nmdown nmcli connection down
end

