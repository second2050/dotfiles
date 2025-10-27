if command --query lsd
    function ls --wraps "lsd" --description "List contents of directory"
        lsd $argv; 
    end
end

