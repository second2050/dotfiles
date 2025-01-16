local status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not status_ok then
    return
end

require("second2050.lsp.handlers").setup()

mason_lsp.setup({
    ensure_installed = {
        "ltex",
        "html",
        "gopls",
        "pylsp",
        "cssls",
        "lua_ls",
    }
})

mason_lsp.setup_handlers({
    function(server_name)
        local server_cfg_status_ok, specific_opts = pcall(require, "second2050.lsp.settings." .. server_name)
        local server_opts = {
            on_attach = require("second2050.lsp.handlers").on_attach,
            capabilities = require("second2050.lsp.handlers").capabilities,
        }
        if server_cfg_status_ok then
            server_opts = vim.tbl_deep_extend("force", server_opts, specific_opts)
        end
        require("lspconfig")[server_name].setup(server_opts)
    end
})
