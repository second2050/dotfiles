if not command --query nix
    return
end

function .man --wraps="nix shell" --description 'open man pages from ephimeral packages'
    if echo "$argv[1]" | grep "#" || echo "$argv[1]" | grep ":"
        nix shell "$argv[1]" --command fish --command "man $argv[2..]"
    else
        nix shell "nixpkgs#$argv[1]" --command fish --command "man $argv[2..]"
    end
end
