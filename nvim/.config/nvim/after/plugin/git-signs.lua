require('gitsigns').setup {
  current_line_blame = true,
  vim.keymap.set('n', '<leader>gp', '<cmd>Gitsigns preview_hunk<cr>', { noremap = true, silent = true })
}
