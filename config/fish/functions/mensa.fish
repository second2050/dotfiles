function mensa --description "Show todays mensa menu"
    set --function current_date (date -I)
    set --function cache_dir "$XDG_CACHE_HOME/mensa"

    mkdir -p $cache_dir
    if not test -f "$cache_dir/$current_date"
        echo "Fetching today's mensa menu..."
        curl --progress-bar https://mobil.itmc.tu-dortmund.de/canteen-menu/v3/canteens/341/$current_date -o "$cache_dir/$current_date"
    end
    
    begin 
        echo -e "\033[1m\033[34m::\033[39m Mensaplan $current_date:\033[0m"
        echo -e (
            jq '.[] | [.counter, .price.student, .title.de] | @tsv' "$cache_dir/$current_date" |\
                sed 's#"##g' |\
                sed 's#\\\\t#\\\\f#g' |\
                awk '{print $0"\\\\n"}' |\
                sort |\
                tr -d '\n' |\
                sed 's#\n$##' |\
                sed 's#[[:space:]]*(# \\\\033[90m(#g' |\
                sed 's#)[[:space:]]*#)\\\\033[0m #g' |\
                sed 's#[[:space:]];#;#g' |\
                sed 's#[[:space:]]*|[[:space:]]*# | #g'
        ) | awk -v FS='\f' '{if ($1) print "\033[1m\033[92m"$2"\033[0m \033[4m\033[1m"$1"\033[0m\n"$3"\n"}'
    end | less --raw-control-chars --quit-if-one-screen
end

