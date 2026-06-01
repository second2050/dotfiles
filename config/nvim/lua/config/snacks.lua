return {
    indent = { enabled = true },
    scroll = { enabled = not vim.g.neovide },
    notifier = { enabled = true },
    dashboard = {
        preset = {
            header = [[
█▄░█ █▀▀ █▀█ █░█ █ █▀▄▀█                                    
█░▀█ ██▄ █▄█ ▀▄▀ █ █░▀░█                                    ]],
            keys = {
                { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                { icon = " ", key = "q", desc = "Quit", action = ":qa" },
            },
        },
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
