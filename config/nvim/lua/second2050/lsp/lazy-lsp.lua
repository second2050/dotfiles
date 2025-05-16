local status_ok, lazy_lsp = pcall(require, "lazy-lsp")
if not status_ok then
    return
end

require("second2050.lsp.handlers").setup()
lazy_lsp.setup {
    prefer_local = true,
    preferred_servers = {
        html = { "html", "ltex" },
        markdown = { "marksman", "ltex" },
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
    },
}
