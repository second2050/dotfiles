if command --query makepkg
    function makepkg --description 'alias makepkg makepkg --log'
        command makepkg --log $argv
    end
end
