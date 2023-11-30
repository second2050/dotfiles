if which makepkg &> /dev/null
    function makepkg --description 'alias makepkg makepkg --log'
        command makepkg --log $argv
    end
end
