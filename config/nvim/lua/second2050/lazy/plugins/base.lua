return {
    "nvim-lua/plenary.nvim",
    -- Colorscheme
    "tanvirtin/monokai.nvim",
    -- Additional Filetypes
    "imsnif/kdl.vim",
    "isobit/vim-caddyfile",
    -- Other Plugins
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
        end,
        cond = function()
            if vim.fn.executable("nix") == 1 then
                return true
            else
                vim.notify_once(
                    "`nix` not available, no language servers will be available!",
                    vim.log.levels.WARN,
                    { level = "warning" }
                )
                return false
            end
        end,
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
                    border = "rounded",
                    code_action = "",
                },
                lightbulb = {
                    virtual_text = false,
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
        "lewis6991/gitsigns.nvim",
        opts = {
            current_line_blame = true,
        },
    },
    {
        "folke/noice.nvim",
        priority = 1000,
        lazy = false,
        -- event = "VeryLazy",
        opts = require("second2050.noice"),
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = require('second2050.snacks'),
        dependencies = {
            "echasnovski/mini.icons",
        },
    },
    {
        "NMAC427/guess-indent.nvim",
        config = function()
            require('guess-indent').setup {}
        end,
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        after = { 'nvim-treesitter' },
        requires = { 'echasnovski/mini.icons', opt = true },
        config = function()
            require('render-markdown').setup({})
        end,
    },
    "lambdalisue/vim-suda",
}
