return {
    -- filetypes
    { "imsnif/kdl.vim" },
    { "isobit/vim-caddyfile" },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        opts = true,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-mini/mini.nvim'
        },
    },
    -- lsp
    {
        "dundalek/lazy-lsp.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("config.lsp.lazy-lsp")
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
        "glepnir/lspsaga.nvim",
        branch = "main",
        opts = {
            ui = {
                border = "rounded",
                code_action = "",
            },
            lightbulb = {
                virtual_text = false,
            },
        },
        lazy = true,
        cmd = "Lspsaga",
        event = "LspAttach",
    },
    { "aznhe21/actions-preview.nvim" },
    -- misc
    {
        "nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
        build = ":TSUpdate",
        lazy = true,
        event = "BufRead",
        opts = {
            highlight = {
                enable = true,
                disable = {""},
                additional_vim_regex_highlighting = true,
            },
            indent = { enable = true },
        },
        dependencies = {
            "nvim-treesitter/nvim-treesitter-textobjects",
        },
    },
    {
        -- The completion plugin
        "hrsh7th/nvim-cmp",
        lazy = true,
        cmd = { "BufRead" },
        config = function()
            require("config.cmp")
        end,
        dependencies = {
            "hrsh7th/cmp-buffer",                    -- buffer completions
            "hrsh7th/cmp-path",                      -- path completions
            "hrsh7th/cmp-cmdline",                   -- cmdline completions
            {
                -- snippet completions
                "saadparwaiz1/cmp_luasnip",
                lazy = true,
                dependencies = {
                    {
                        "L3MON4D3/LuaSnip",
                        name = "luasnip",
                        lazy = true,
                        config = function()
                            require("luasnip").config.setup({
                                history = false,
                            })
                        end,
                        dependencies = {
                            "rafamadriz/friendly-snippets",
                        },
                    },
                },
            },
            {
                "onsails/lspkind.nvim",
                opts = true
            },
        },
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {
            check_ts = true,
            ts_config = {
                lua = { "string", "source" },
                javascript = { "string", "template_string" },
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = "<M-e>",
                chars = { "{", "[", "(", '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
                offset = 0, -- Offset from pattern match
                end_key = "$",
                keys = "qwertzuiopyxcvbnmasdfghjkl",
                check_comma = true,
                highlight = "PmenuSel",
                highlight_grey = "LineNr",
            },
        }
    },
    {
        -- Actually color colorcodes like #ff0000
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
                mode = "background",
            })
        end,
        lazy = true,
        event = { "BufRead" },
    },
    {
        "3rd/image.nvim",
        opts = {
            backend = "sixel",
            processor = "magick_cli",
            integrations = {
                markdown = {
                    clear_in_insert_mode = true,
                    only_render_image_at_cursor = true,
                },
            },
        },
    },
    {
        "NMAC427/guess-indent.nvim",
        opts = true,
    },
}
