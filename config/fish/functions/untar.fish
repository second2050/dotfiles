function untar --description="Extract tape archives" --argument-names "Path to archive"
    tar -zxvf $argv[1]
end