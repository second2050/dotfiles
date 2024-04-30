function checkupdates
    echo -e "\033[1m\033[34m::\033[39m Checking for updates..."
    command checkupdates > /tmp/chkupd_tmprslt
    set chkstatus $status

    # check if checkupdates ran correctly 
    if test $chkstatus -eq 2 # statuscode `2` is used by checkupdates if the system is up to date
        echo -e "\033[1m\033[34m::\033[39m System is up to date!"
        return 0
    else if test $chkstatus -ne 0 # catch all for everything else
        echo -e "\033[1m\033[34m::\033[39m 'checkupdates' ran into an issue. \033[31mError $chkstatus"
    end

    # output pending updates list
    begin
        echo -e "\033[1m\033[34m::\033[39m $(cat /tmp/chkupd_tmprslt | wc -l) updates pending..."
        cat /tmp/chkupd_tmprslt | awk '{ print "\033[1m" $1 "\033[0m \033[90m" $2 "\033[0m \033[90m" "\033[1m->" "\033[0m \033[90m" $4 "\033[0m" }'
    end | less --quit-if-one-screen --raw-control-chars
end

