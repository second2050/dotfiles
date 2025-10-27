if test -d "/nix/store"
    function nix-search-store
        for n in $argv
            find /nix/store -maxdepth 1 -name "\*$n\*"
        end
    end
end
