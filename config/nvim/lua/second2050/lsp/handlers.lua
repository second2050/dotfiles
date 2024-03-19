local M = {}

local function lsp_keymaps(bufnr)
    local wk = require("which-key")
    local wk_opts = {
        mode = "n",
        prefix = "g",
        noremap = true,
        silent = true,
        buffer = bufnr
    }

    wk.register({
        d = { "<cmd>Telescope lsp_definitions<CR>", "Definition" },
        D = { "<cmd>Lspsaga finder<CR>", "LSP finder" },
        i = { "<cmd>Telescope lsp_implementations<CR>", "Implementation" },
        r = { "<cmd>Telescope lsp_references<CR>", "References" },
        s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
        S = { "<cmd>Telescope lsp_workspace_symbols<CR>", "Workspace Symbols" },
    }, wk_opts)

    wk_opts.prefix = "<leader>l"
    wk.register({
        name = "Language Server",
        a = { "<cmd>lua require('actions-preview').code_actions()<CR>", "Code Action" },
        d = { "<cmd>Lspsaga show_cursor_diagnostics<cr>", "Show Cursor Diagnostic" },
        e = { "<Plug>(doge-generate)", "Generate Documentation" },
        f = {
            function()
                vim.lsp.buf.format()
            end,
            "Format File",
        },
        c = {
            function()
                vim.lsp.codelens.run()
            end,
            "Run Code Lens",
        },
        h = {
            function()
                vim.lsp.buf.hover()
            end,
            "Hover",
        },
        r = { "<cmd>Lspsaga rename<cr>", "Rename" },
        s = {
            function()
                vim.lsp.buf.signature_help()
            end,
            "Signature Help",
        },
    }, wk_opts)

    wk_opts.prefix = ""
    wk.register({
        ["[d"] = { "<cmd>Lspsaga diagnostic_jump_prev<cr>", "Previous Diagnostic" },
        ["]d"] = { "<cmd>Lspsaga diagnostic_jump_next<cr>", "Next Diagnostic" },
    }, wk_opts)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    return
end

M.setup = function()
end

M.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
