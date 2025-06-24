local status_ok, lazy_lsp = pcall(require, "lazy-lsp")
if not status_ok then
    return
end

local hostname_fd = io.popen("hostname")
local hostname = "ringo"
if hostname_fd ~= nil then
    hostname = hostname_fd:read()
    hostname_fd:close()
end

require("second2050.lsp.handlers").setup()
lazy_lsp.setup {
    prefer_local = true,
    preferred_servers = {
        html = { "html", "ltex" },
        markdown = { "marksman", "ltex" },
        nix = { "nixd" },
        python = { "basedpyright" },
        cpp = { "clangd" },
    },
    default_config = {
        on_attach = require("second2050.lsp.handlers").on_attach,
        capabilities = require("second2050.lsp.handlers").capabilities,
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
                        nixos = { expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations." .. hostname .. ".options" },
                        home_manager = { expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations." .. hostname .. ".options.home-manager.users.type.getSubOptions []" },
                    },
                },
            },
        },
    },
}
