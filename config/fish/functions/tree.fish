if command --query lsd
    function tree --wraps='lsd --tree' --description 'alias tree lsd --tree'
        lsd --tree $argv
    end
end

