-- setup general look of neovim
vim.opt.fillchars = { eob = " " } -- Hide "End of Buffer" (Tilde) Character
vim.opt.number = true -- Show Line Numbers
vim.opt.cursorline = true -- highlight current line

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- misc settings
vim.opt.clipboard = "unnamedplus" -- Use System Clipboard
vim.opt.showmode = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.listchars = "tab:<->,multispace:·,space:␣,trail:·,eol:↵"
vim.opt.scrolloff = 5

-- transparent winbar
vim.api.nvim_set_hl(0, "WinBar", {fg = "#ffffff", bg = nil})
vim.api.nvim_set_hl(0, "WinBarNC", {fg = "#ffffff", bg = nil})

-- windows specifics
if vim.loop.os_uname().sysname == "Windows_NT" then
    vim.opt.shell = "pwsh"
    vim.opt.shellcmdflag = "-NoLogo -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
    vim.opt.shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait"
    vim.opt.shellpipe = "2>&1 | Out-File -Encoding UTF8; exit $LastExitCode"
    vim.opt.shellquote = ""
    vim.opt.shellxquote = ""
end
