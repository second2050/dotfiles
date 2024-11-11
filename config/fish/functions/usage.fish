function usage --wraps="du --summarize --human-readable" --description 'Shows size of files and directories'
    set --local cmd du --summarize --human-readable

    if count $argv > /dev/null
        $cmd $argv
    else
        $cmd (pwd)
    end
end

