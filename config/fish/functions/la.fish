if command --query lsd
    function la --wraps lsd --description "List contents of directory, including hidden files in directory using long format"
        lsd --long --all --git --human-readable --group-dirs first $argv;
    end
end
