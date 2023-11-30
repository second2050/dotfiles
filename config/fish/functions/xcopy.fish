function xcopy --wraps='xclip -in -selection clipboard' --description 'alias xcopy xclip -in -selection clipboard'
    xclip -in -selection clipboard $argv
end
