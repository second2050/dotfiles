return {
    indent = { enabled = true },
    scroll = { enabled = true },
    notifier = { enabled = true },
    dashboard = {
        enabled = true,
        sections = {
            {
                pane = 1,
                section = "header"
            },
            {
                pane = 1,
                section = "keys",
                gap = 0,
                padding = 1 },
            {
                pane = 1,
                icon = " ",
                title = "Recent Files",
                section = "recent_files",
                indent = 2,
                padding = 1
            },
            {
                pane = 1,
                icon = " ",
                title = "Projects",
                section = "projects",
                indent = 2,
                padding = 1
            },
            {
                pane = 1,
                section = "startup"
            },
            {
                pane = 2,
                icon = " ",
                title = "Git Status",
                section = "terminal",
                enabled = function()
                    return Snacks.git.get_root() ~= nil
                end,
                cmd = "git status --short --branch --renames",
                -- height = 5,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
            },
            {
                pane = 2,
                icon = " ",
                title = "Git Log",
                section = "terminal",
                enabled = function()
                    return Snacks.git.get_root() ~= nil
                end,
                cmd = "git --no-pager log --graph --oneline --no-decorate",
                height = 5,
                padding = 1,
                ttl = 5 * 60,
                indent = 3,
            },
        },
    },
}
