-- Variables
local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap

map("n", "<leader>ff", ":Telescope find_files<cr>", opts)
map("n", "<leader>fb", ":Telescope buffers<cr>", opts)
map("n", "<leader>fh", ":Telescope oldfiles<cr>", opts)
map("n", "<leader>gg", ":Telescope live_grep<cr>", opts)
map("n", "<leader>gf", ":Telescope diagnostics<cr>", opts)
