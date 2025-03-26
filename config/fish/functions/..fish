if not command --query nix
    return
end

function . --wraps="nix run" --description 'run applications ephimerally via nix run'
    if echo "$argv[1]" | grep "#" || echo "$argv[1]" | grep ":"
        nix run "$argv[1]" -- $argv[2..]
    else
        nix run "nixpkgs#$argv[1]" -- $argv[2..]
    end
end
