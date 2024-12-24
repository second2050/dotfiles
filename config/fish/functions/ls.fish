if command --query lsd
    function ls --wraps='lsd'
        lsd $argv; 
    end
end

