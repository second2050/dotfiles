function checkupdates
    echo Checking for updates...
    command checkupdates > /tmp/chkupd_tmprslt
    if test $status -eq 0
        begin
            echo "Update Information"
            echo "=================="
            echo " ==> $(cat /tmp/chkupd_tmprslt | wc -l) updates pending..."
            echo ""
            echo " ==> Package list:"
            cat /tmp/chkupd_tmprslt
        end | less --quit-if-one-screen
    else if test $status -eq 2
        echo System is up to date!
        return 0
    end
end

