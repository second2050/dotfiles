if command --query lsd
    function ls --wraps='lsd'
        lsd $argv; 
    end
    function ll --wraps='lsd --long --human-readable --group-dirs first'
        lsd --long --human-readable --group-dirs first $argv;
    end
    function tree --wraps='lsd --tree' --description 'alias tree lsd --tree'
        lsd --tree $argv
    end
end
