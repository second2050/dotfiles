if command --query lsd
    function ll --wraps "lsd" --description "List contents of directory using long format"
        lsd --long --git --human-readable --group-dirs first $argv;
    end
end

