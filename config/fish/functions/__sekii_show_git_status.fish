function __sekii_show_git_status
    set -l isGitRepo (git rev-parse --is-inside-work-tree 2> /dev/null)
    if test -n "$isGitRepo"
        git -c color.ui=always status &| less --raw-control-chars
    end
end

