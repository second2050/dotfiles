# include direnv if available
if command --query direnv
    direnv hook fish | source
end

