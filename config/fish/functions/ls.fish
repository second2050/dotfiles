function ls; 
    /usr/bin/lsd $argv; 
end
function ll;
    /usr/bin/lsd --long --human-readable --group-dirs first $argv;
end
