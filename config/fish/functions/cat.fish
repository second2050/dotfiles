if which bat &> /dev/null
    function cat --wraps=bat
        bat $argv   
    end
end
