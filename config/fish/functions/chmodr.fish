function chmodr --description="Resets permissions in a folder to 'rw-r--r--'" --argument-names "Folder"
    chmod 755 (find $argv[1] -type d)
    chmod 644 (find $argv[1] -type f)
end