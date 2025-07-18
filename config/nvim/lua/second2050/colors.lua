M = {}

M.palette = require("monokai").classic

-- transparent winbar
vim.api.nvim_set_hl(0, "WinBar", {fg = "#ffffff", bg = nil})
vim.api.nvim_set_hl(0, "WinBarNC", {fg = "#ffffff", bg = nil})

return M

