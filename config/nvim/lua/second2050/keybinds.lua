local opts = { noremap = true, silent = true }
local wk = require("which-key")
local keymap = vim.api.nvim_set_keymap

-- Leader Key
keymap("", "<Space>", "<Nop>", opts)

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize windows with ←↓↑→
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) -- stop nvim from yanking things when pasting over other things

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- NeoTree
keymap("n", "<C-n>", ":Neotree toggle<cr>", opts)

wk.add({
    { "<leader>f", group = "Find", remap = false },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Search Buffers", remap = false },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", remap = false },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live Grep", remap = false },
    { "<leader>h", "<cmd>noh<cr>", desc = "Dismiss Highlights", remap = false },
    { "<leader>g", group = "Git", remap = false },
    { "<leader>gd", "<cmd>Gitsigns toggle_deleted<cr>", desc = "Show Deletions", remap = false },
    { "<leader>gb", group = "Blame", remap = false },
    { "<leader>gbi", "<cmd>Gitsigns toggle_current_line_blame<cr>", desc = "Show Blame inline", remap = false },
    { "<leader>gbs", "<cmd>Gitsigns blame<cr>", desc = "Show Blame in sidebar", remap = false },
    { "<leader>gbh", "<cmd>Gitsigns blame_line<cr>", desc = "Show Blame", remap = false },
})

