require("config.lsp.handlers").setup()
require("lazy-lsp").setup {
    use_vim_lsp_config = true,
    prefer_local = true,
    preferred_servers = {
        html = { "html", "ltex" },
        markdown = { "marksman", "ltex" },
        nix = { "nixd" },
        python = { "basedpyright" },
        cpp = { "clangd" },
    },
    default_config = {
        on_attach = require("config.lsp.handlers").on_attach,
        capabilities = require("config.lsp.handlers").capabilities,
    },

    -- config overrides
    configs = {
        lua_ls = {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { "vim" },
                    },
                },
            },
        },
        ltex = {
            settings = {
                ltex = {
                    language = "de-DE",
                },
            },
        },
        nixd = {
            settings = {
                nixd = {
                    options = {
                        -- nixos = { expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations." .. hostname .. ".options" },
                        -- home_manager = { expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations." .. hostname .. ".options.home-manager.users.type.getSubOptions []" },
                    },
                    formatting = {
                        command = "nixfmt",
                    },
                },
            },
        },
    },
}
