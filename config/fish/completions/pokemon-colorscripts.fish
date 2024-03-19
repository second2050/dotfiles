set -l command pokemon-colorscripts
complete --command $command --no-files # disable file name completion

complete --command $command -s h -l help \
    -d "Show help message"
complete --command $command -s l -l list \
    -d "Print list of all pokemon"
complete --command $command -s n -l name -fra "(pokemon-colorscripts --list)" \
    -d "Select pokemon by name"
complete --command $command -s f -l form \
    -d "Show an alternate form of a pokemon"
complete --command $command -l no-title \
    -d "Do not display pokemon name"
complete --command $command -s s -l shiny \
    -d "Show the shiny version of the pokemon instead"
complete --command $command -s b -l big \
    -d "Show a larger version of the sprite"
complete --command $command -s r -l random -fra "1 2 3 4 5 6 7 8" \
    -d "Show a random pokemon"

