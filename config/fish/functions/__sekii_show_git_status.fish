function __sekii_show_git_status
    set -f isGitRepo (git rev-parse --is-inside-work-tree 2> /dev/null)
    if test -n "$isGitRepo"
        begin
            if not test (git worktree list | wc -l) -eq "1"
                echo -e "\033[1m\033[34m::\033[39m Worktrees\033[0m"
                git worktree list | awk '{print "   " $0}'
                echo ""
            end
            echo -e "\033[1m\033[34m::\033[39m Worktree status" [(git rev-parse --show-toplevel)] "\033[0m"
            git -c color.ui=always status | awk '{print "   " $0}'
            echo -e "\n\033[1m\033[34m::\033[39m Commit log\033[0m"

            if ! git rev-parse --abbrev-ref @ &> /dev/null; return; end # break if there aren't any commits

            # set difference between local and upstream to zero if there is not upstream
            if git rev-parse --abbrev-ref @{u} &> /dev/null
                set -f __sekii_git_commit_count (git rev-list --count @{u}..@)
            else
                set -f __sekii_git_commit_count 0
            end

            # show non pushed commits
            git -c color.ui=always log --graph --max-count $__sekii_git_commit_count | awk '{print "   " $0}'
            # if test "$__sekii_git_commit_count" -ne "0"; echo ""; end
            git -c color.ui=always log --graph --oneline | tail -n +(math $__sekii_git_commit_count + 1) | awk '{print "   " $0}'
        end &| less --raw-control-chars
    end
end

