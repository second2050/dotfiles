return {
    {
        -- colorscheme
        "tanvirtin/monokai.nvim",
        opts = true
    },
    {
        -- use transparent background
        "xiyaowong/transparent.nvim",
        opts = {
            extra_groups = {
                "TelescopeNormal",
                "TelescopeBorder",
                "TelescopePromptBorder",
            },
            exclude_groups = {}, -- table: groups you don't want to clear
        }
    },
    {
        -- statusline
        "second2050/feline.nvim",
        name = "feline",
        dependencies = {
            "SmiteshP/nvim-navic",
            "nvim-tree/nvim-web-devicons",
            "lewis6991/gitsigns.nvim",
        },
        opts = require("config.statusline"),
    },
    {
        "folke/noice.nvim",
        priority = 1000,
        lazy = false,
        -- event = "VeryLazy",
        opts = require("config.noice"),
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
        opts = require('config.snacks'),
        dependencies = {
            "echasnovski/mini.icons",
        },
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            current_line_blame = true,
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
                -- A native Sorter for telescope to increase performance
                "nvim-telescope/telescope-fzf-native.nvim",
                build =
                "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
                lazy = true,
            },
        },
    },
    {
        "folke/which-key.nvim",
        config = true,
        lazy = true
    },
}
