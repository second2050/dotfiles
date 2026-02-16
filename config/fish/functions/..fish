if not status is-interactive
    return
end

if not command --query nix
    return
end

function . --wraps="nix run" --description 'run applications ephimerally via nix run'
    set -l env_vars "NIXPKGS_ALLOW_UNFREE=1"
    set -l nix_args "--impure"
    if test "$argv[1]" = ""
        echo -e "usage:\n → . hello\n → . nixpkgs#hello\n → . github:nix-community/plasma-manager"
    else if echo "$argv[1]" | grep -e "#" -e ":" > /dev/null
        env $env_vars nix run $nix_args "$argv[1]" -- $argv[2..]
    else
        env $env_vars nix run $nix_args "nixpkgs#$argv[1]" -- $argv[2..]
    end
end
