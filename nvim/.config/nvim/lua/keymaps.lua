-- Options for mappings
local opts = { noremap = true, silent = true }
local opts_expr = { noremap = true, silent = true, expr = true }

-- Shorten the functions' name
local map = vim.api.nvim_set_keymap

--Remap space as leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Better window rotation
map("n", "<C-]>", "<C-w>r", opts)
map("n", "<C-[>", "<C-w>R", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Easily copy, cut, paste from system clipboard
map("v", "<C-y>", [["+y]], opts)
map("v", "<C-x>", [["+x]], opts)
map("", "<C-p>", [["+p]], opts)

-- Toggle Spell check
map("", "<F7>", ":set spell!<CR>", opts)

-- Toggle Light/Dark mode
map("", "<F9>", [[':set bg='.(&bg=='dark' ? "light" : "dark")."<CR>"]], opts_expr)

-- Navigate between buffers
map("n", "<leader><Tab>", ":bnext<CR>", opts)
map("n", "<leader><S-Tab>", ":bprev<CR>", opts)

-- Close buffers easily
map("n", "<leader>c", ":bd<CR>", opts)
map("n", "<leader><S-c>", ":bd!<CR>", opts)

-- Save the current buffer
map("n", "<leader>w", ":w<CR>", opts)

-- Execute the current buffer if possible
map("n", "<leader>r", ":!./%<CR>", opts)

-- Shell like navigation in command mode
map("c", "<C-a>", "<Home>", { noremap = true })
map("c", "<C-e>", "<End>", { noremap = true })

-- Toggle text wrap
map("n", "<leader>s", ":set wrap!<CR>", opts)

-- Better escape key for terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", opts)

-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
