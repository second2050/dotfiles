function __sekii_show_git_status
    set -l isGitRepo (git rev-parse --is-inside-work-tree 2> /dev/null)
    if test -n "$isGitRepo"
        begin
            if not test (git worktree list | wc -l) -eq "1"
                echo -e "\033[1m\033[34m::\033[39m Worktrees\033[0m"
                git worktree list | awk '{print "   " $0}'
                echo ""
            end
            echo -e "\033[1m\033[34m::\033[39m Worktree status" [(pwd)] "\033[0m"
            git -c color.ui=always status | awk '{print "   " $0}'
            echo -e "\n\033[1m\033[34m::\033[39m Commit log\033[0m"
            git -c color.ui=always log --max-count 3 | awk '{print "   " $0}'
            echo ""
            git -c color.ui=always log --oneline | tail -n +4 | awk '{print "   " $0}'
        end &| less --raw-control-chars
    end
end

