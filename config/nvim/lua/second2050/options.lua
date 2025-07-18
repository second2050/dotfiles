-- setup general look of neovim
vim.opt.fillchars = { eob = " " } -- Hide "End of Buffer" (Tilde) Character
vim.opt.number = true -- Show Line Numbers
vim.opt.cursorline = true -- highlight current line

-- colorscheme
local colorscheme = "monokai"
local palette = require("monokai").classic
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end

-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- 
vim.opt.clipboard = "unnamedplus" -- Use System Clipboard
vim.opt.showmode = false
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"

-- transparent winbar
vim.api.nvim_set_hl(0, "WinBar", {fg = "#ffffff", bg = nil})
vim.api.nvim_set_hl(0, "WinBarNC", {fg = "#ffffff", bg = nil})

