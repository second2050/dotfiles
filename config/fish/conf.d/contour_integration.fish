if not test "$TERM" = "contour"
    return
end

function precmd_hook_contour -d "Shell Integration hook to be invoked before each prompt" -e fish_prompt
    # Disable text reflow for the command prompt (and below).
    printf '\e[?2028l'

    # Marks the current line as the command prompt, so that you can jump to it via key bindings.
    printf '\e[>M'
    # printf '\e]133;P;k=i\e\\'

    # Informs contour terminal about the current working directory, so that e.g. OpenFileManager works.
    printf "\e]7;$PWD\e\\"

    # Set tab name to something memorable
    printf "\e]30;%s %s-%s\e\\" \
        "$(if test $SHLVL -gt "1"
            printf "%s " "$SHLVL"
        else 
            printf ""
        end)" \
        "$__karui_adjective" \
        (string split " " "$__karui_pokemon")[1]
end

function preexec_hook_contour -d "Run after printing prompt" -e fish_preexec
    set -f __app (string split " " $argv[1] | string match --regex --invert "=" -m 2)
    switch $__app[1]
        case cat bat less; set -f __icon "󰧮"
        case fish_config nixos_config; set -f __icon ""
        case git; set -f __icon ""
        case journalctl; set -f __icon ""
        case nix nh nom lix '.' ','; set -f __icon "󱄅"
        case nvim vim vi; set -f __icon ""
        case systemctl 'systemd*' userctl; set -f __icon "󰣖"
        case '*'; set -f __icon ""
    end
    if test "$__app[1]" = '.'
        set -f __app $__app[2]
    end
    printf "\e]30;%s %s\e\\" "$__icon" "$__app[1]" #"$__karui_adjective" "$__karui_pokemon"

    # Enables text reflow for the main page area again, so that a window resize will reflow again.
    printf "\e[?2028h"
end
