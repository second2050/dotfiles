# load OS specific configuration
if test (uname -s) = "Darwin"
    # Load homebrew if available
    if test -x /opt/homebrew/bin/brew
        /opt/homebrew/bin/brew shellenv | source
    end

    # Add cargo to path if available
    if command --query cargo
        set --prepend PATH $HOME/.cargo/bin
    end
    
    # add local bin directory to path
    set --prepend PATH $HOME/.local/bin

    # switch automatically to goldwarden if interactive.
    if status is-interactive && not set -q SSH_CLIENT
        ssh-switch &> /dev/null
    end
end
    
