if test -d "/nix/store"
    function nix-search-store
        for n in $argv
            find /nix/store -maxdepth 1 -iregex "/nix/store/[a-z0-9]*-$n.*"
        end
    end
end
