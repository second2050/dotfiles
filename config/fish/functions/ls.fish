if command --query lsd
    function ls --wraps "lsd" --description "List contents of directory"
        lsd --hyperlink auto $argv; 
    end
end

