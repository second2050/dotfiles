if not command --query nix
    return
end

function . --wraps="nix run" --description 'run applications ephimerally via nix run'
    if test "$argv[1]" = ""
        echo -e "usage:\n → . hello\n → . nixpkgs#hello\n → . github:nix-community/plasma-manager"
    else if echo "$argv[1]" | grep -e "#" -e ":" > /dev/null
        nix run "$argv[1]" -- $argv[2..]
    else
        nix run "nixpkgs#$argv[1]" -- $argv[2..]
    end
end
