function untar --description="Extract tape archives" --argument-names "Path to archive"
    tar -xvf $argv[1]
end

