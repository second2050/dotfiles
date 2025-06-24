if not command --query nix
    return
end



function , --wraps="nix shell" --description 'open nix shell with specified packages'
    if test "$argv[1]" = ""
        echo -e "usage:\n → , hello\n → , nixpkgs#hello\n → , github:nix-community/plasma-manager"
    end

    for arg in $argv
        if echo "$arg" | grep -e "#" -e ":" > /dev/null
            set --append argv_parsed $arg
        else
            set --append argv_parsed "nixpkgs#$arg"
        end
    end
    nix shell $argv_parsed
end
