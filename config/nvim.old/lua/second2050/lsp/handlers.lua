local M = {}

local function lsp_keymaps(bufnr)
    local wk = require("which-key")

    wk.add({
        { "gD", "<cmd>Lspsaga finder<CR>",                  desc = "LSP finder",        remap = false },
        { "gS", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace Symbols", remap = false },
        { "gd", "<cmd>Telescope lsp_definitions<CR>",       desc = "Definition",        remap = false },
        { "gi", "<cmd>Telescope lsp_implementations<CR>",   desc = "Implementation",    remap = false },
        { "gr", "<cmd>Telescope lsp_references<CR>",        desc = "References",        remap = false },
        { "gs", "<cmd>Telescope lsp_document_symbols<CR>",  desc = "Document Symbols",  remap = false },
    })

    wk.add({
        { "<leader>l",  group = "Language Server",                                remap = false },
        { "<leader>la", "<cmd>lua require('actions-preview').code_actions()<CR>", desc = "Code Action", remap = false },
        {
            "<leader>lc",
            function()
                vim.lsp.codelens.run()
            end,
            desc = "Run Code Lens",
            remap = false
        },
        { "<leader>ld", "<cmd>Lspsaga show_cursor_diagnostics<cr>", desc = "Show Cursor Diagnostic", remap = false },
        { "<leader>le", "<Plug>(doge-generate)",                    desc = "Generate Documentation", remap = false },
        {
            "<leader>lf",
            function()
                vim.lsp.buf.format()
            end,
            desc = "Format File",
            remap = false
        },
        {
            "<leader>lh",
            function()
                vim.lsp.buf.hover()
            end,
            desc = "Hover",
            remap = false
        },
        { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename", remap = false },
        {
            "<leader>ls",
            function()
                vim.lsp.buf.signature_help()
            end,
            desc = "Signature Help",
            remap = false
        },
    })

    wk.add({
        { "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous Diagnostic", remap = false },
        { "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next Diagnostic",     remap = false },
    })
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
    if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(true, nil, bufnr)
    end
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
