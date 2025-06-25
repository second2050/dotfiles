return {
    "nvim-lua/plenary.nvim",
    -- Colorscheme
    "tanvirtin/monokai.nvim",
    {
        "xiyaowong/transparent.nvim",
        config = function()
            vim.cmd("TransparentEnable")

            require("transparent").setup({ -- Optional, you don't have to run setup.
                extra_groups = {},
                exclude_groups = {},       -- table: groups you don't want to clear
            })
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim"
        }
    },
    {
        -- A native Sorter for telescope to increase performance
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
        lazy = true,
    },
    {
        "nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
        build = ":TSUpdate",
        lazy = true,
        event = "BufRead",
        config = function()
            require("second2050.treesitter")
        end,
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },
    {
        "dundalek/lazy-lsp.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("second2050.lsp.lazy-lsp")
        end
    },
    {
        -- The completion plugin
        "hrsh7th/nvim-cmp",
        lazy = true,
        cmd = { "BufRead" },
        config = function()
            require("second2050.cmp")
        end,
        dependencies = {
            "hrsh7th/cmp-buffer",                    -- buffer completions
            "hrsh7th/cmp-path",                      -- path completions
            "hrsh7th/cmp-cmdline",                   -- cmdline completions
            "davidsierradz/cmp-conventionalcommits", -- conventional commits
            {
                -- snippet completions
                "saadparwaiz1/cmp_luasnip",
                lazy = true,
                dependencies = {
                    {
                        -- Snippets
                        "L3MON4D3/LuaSnip",
                        name = "luasnip",
                        lazy = true,
                        config = function()
                            require("luasnip").config.setup({
                                history = false,
                            })
                        end,
                        dependencies = {
                            --{ "michaelb/sniprun", build = "bash ./install.sh", lazy = true }, -- Run code snippets
                            "rafamadriz/friendly-snippets", -- a bunch of snippets to use
                        },
                    },
                },
            },
        },
    },
    {
        -- LSP completions
        "hrsh7th/cmp-nvim-lsp",
        lazy = true,
        event = "LspAttach",
        dependencies = { "hrsh7th/nvim-cmp" },
    },
    {
        "onsails/lspkind.nvim",
        config = function()
            --  
            require("lspkind").init({
                symbol_map = {
                    Text = "󰉿",
                    Method = "󰆧",
                    Function = "󰊕",
                    Constructor = "",
                    Field = "󰜢",
                    Variable = "󰀫",
                    Class = "󰠱",
                    Interface = "",
                    Module = "",
                    Property = "󰜢",
                    Unit = "󰑭",
                    Value = "󰎠",
                    Enum = "",
                    Keyword = "󰌋",
                    Snippet = "",
                    Color = "󰏘",
                    File = "󰈙",
                    Reference = "󰈇",
                    Folder = "󰉋",
                    EnumMember = "",
                    Constant = "󰏿",
                    Struct = "󰙅",
                    Event = "",
                    Operator = "󰆕",
                    TypeParameter = "󰊄",
                    Copilot = "",
                },
            })
        end,
    },
    {
        -- Auto-close parentheses
        "windwp/nvim-autopairs",
        lazy = true,
        event = { "BufRead" },
        config = function()
            require("second2050.autopairs")
            --require("nvim-autopairs").setup({})
        end,
        dependencies = {
            "hrsh7th/nvim-cmp",
        },
    },
    {
        "folke/which-key.nvim",
        config = true,
        lazy = true
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
            -- Allows you to pick windows
            {
                "s1n7ax/nvim-window-picker",
                version = "2.*",
                config = function()
                    require("window-picker").setup({
                        filter_rules = {
                            include_current_win = false,
                            autoselect_one = true,
                            -- filter using buffer options
                            bo = {
                                -- if the file type is one of following, the window will be ignored
                                filetype = { "neo-tree", "neo-tree-popup", "notify" },
                                -- if the buffer type is one of following, the window will be ignored
                                buftype = { "terminal", "quickfix" },
                            },
                        },
                    })
                end,
            },
        },
        lazy = true,
        cmd = "Neotree",
        event = "BufEnter",
        opts = require("second2050.neo-tree"),
    },
    {
        "aznhe21/actions-preview.nvim",
        lazy = true,
        event = "LspAttach",
        config = function()
            require("actions-preview").setup({
                highlight_command = { require("actions-preview.highlight").delta() },
            })
        end,
    },
    {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({
                ui = {
                    theme = "round",
                    border = "rounded",
                },
            })
        end,
        lazy = true,
        cmd = "Lspsaga",
        event = "LspAttach",
    },
    {
        -- Actually color colorcodes #ff0000
        "norcalli/nvim-colorizer.lua",
        name = "colorizer",
        config = function()
            require("colorizer").setup({
                "*",
                html = {
                    names = true,
                    css = true,
                },
                css = {
                    names = true,
                    css = true,
                },
            }, {
                names = false,
                mode = "foreground",
            })
        end,
        lazy = true,
        event = { "BufRead" },
    },
    {
        -- Nice statusbar
        "second2050/feline.nvim",
        name = "feline",
        dependencies = {
            "SmiteshP/nvim-navic",
        },
        config = function()
            require("feline").setup(require("second2050.feline_conf").bottom_bar)
            --require("feline").winbar.setup(require("second2050.feline_conf").top_bar)
        end,
    },
    { "echasnovski/mini.sessions", version = false, opts = {} },
    {
        "MysticalDevil/inlay-hints.nvim",
        event = "LspAttach",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            require("inlay-hints").setup()
        end
    },
    { "https://github.com/imsnif/kdl.vim" },
    { "lewis6991/gitsigns.nvim" },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
            lsp = {
                progress = {
                    view = "mini",
                },
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = true,         -- use a classic bottom cmdline for search
                command_palette = false,      -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = true,        -- add a border to hover docs and signature help
            },
            cmdline = {
                view = "cmdline",
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "fish" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = { pattern = "^:%s*he?l?p?%s+", icon = "?" },
                    input = { view = "cmdline_input", icon = "󰥻 " },
                }
            },
            messages = {
                view_search = "mini",
            },
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            indent = { enabled = true },
            scroll = { enabled = true },
            notifier = { enabled = true },
            dashboard = {
                enabled = true,
                sections = {
                    { pane = 1, section = "header" },
                    { pane = 1, section = "keys", gap = 0, padding = 1 },
                    { pane = 1, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                    { pane = 1, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                    { pane = 1, section = "startup" },
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
            }
        },
        dependencies = {
            "echasnovski/mini.icons",
        },
    },
    {
        "NMAC427/guess-indent.nvim",
        config = function ()
            require('guess-indent').setup {}
        end,
    },
}
