# Load Starship Prompt if available and interactive
if not status is-interactive
    return
end

if command --query starship
    starship init fish | source
    # overwrite starship's right prompt if available
    if test -e "$FISH_FUNCTION_DIR/fish_right_prompt.fish"
        source "$FISH_FUNCTION_DIR/fish_right_prompt.fish"
    end
    enable_transience
else
    echo ":: [starship] not available, falling back to simple prompt"
end

