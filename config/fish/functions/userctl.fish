if command --query systemctl
    function userctl --wraps='systemctl --user' --description 'alias userctl systemctl --user'
        systemctl --user $argv
    end
end

