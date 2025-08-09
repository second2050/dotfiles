-- PreLoad
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
vim.g['suda#prompt'] = "Suda: Password: "

-- neovide
if vim.g.neovide then
    vim.o.guifont = "Maple Mono NF:h12"
    vim.g.neovide_opacity = 0.8
    vim.g.neovide_window_blurred = true
    vim.g.neovide_floating_corner_radius = 1.0
end

