function ctsh --description 'Cheat sheet for terminal applications'
    curl --silent cheat.sh/$argv[1] | less --raw-control-chars
end

