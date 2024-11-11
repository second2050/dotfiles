if command --query bat
    function cat --wraps=bat
        bat $argv   
    end
end

