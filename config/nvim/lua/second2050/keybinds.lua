local opts = { noremap = true, silent = true }
local wk = require("which-key")
local wk_opts = {
    mode = "n",
    prefix = "<leader>",
    noremap = true,
    silent = true
}
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

wk.register({
    f = {
        name = "Find",
        f = { "<cmd>Telescope find_files<cr>", "Find File" },
        b = { "<cmd>Telescope buffers<cr>", "Search Buffers" },
        l = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    },
    h = { "<cmd>noh<cr>", "Dismiss Highlights" }
}, wk_opts)

