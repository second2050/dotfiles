function fish_greeting
    if echo $PATH | grep /nix/store &> /dev/null
        return
    end
    if not set -q fish_greeting
        if command --query pokemon-colorscripts && tty | ! grep tty > /dev/null && ! set -q ASCIINEMA_REC
            set -l __karui_pokemon_output (pokemon-colorscripts --random 1-5 | string split "\n")
            set -gx __karui_pokemon "$__karui_pokemon_output[1]"
            set -gx __karui_adjective (random choice cute adorable sweet lovely caring)
            for l in $__karui_pokemon_output[2..]
                printf '%s\n' "$l"
            end
        else
            set -l line (_ 'Welcome to °<><, the friendly interactive shell')
            set -g fish_greeting "$line"
        end
    end

    if set -q fish_private_mode
        set -l line (_ "fish is running in private mode, history will not be persisted.")
        if set -q fish_greeting[1]
            set -g fish_greeting $fish_greeting\n$line
        else
            set -g fish_greeting $line
        end
    end

    # The greeting used to be skipped when fish_greeting was empty (not just undefined)
    # Keep it that way to not print superfluous newlines on old configuration
    test -n "$fish_greeting"
    and echo $fish_greeting
end

