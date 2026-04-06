if not command -q nh
    return
end

function nh
    set -lx SYSTEMD_LOG_LEVEL 0
    systemd-inhibit \
        --who="nix helper" \
        --why="nh is working on the system configuration" \
        --mode="block" \
        --what="shutdown:sleep" \
        nh $argv
end
