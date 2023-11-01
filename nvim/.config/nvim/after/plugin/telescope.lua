-- Variables
local opts = { noremap = true }
local builtin = require('telescope.builtin')
local map = vim.keymap.set
local telescope = require('telescope')

map('n', '<leader>ff', builtin.find_files, opts)
map('n', '<leader>fb', builtin.buffers, opts)
map('n', '<leader>fh', builtin.oldfiles, opts)
map('n', '<leader>gg', builtin.live_grep, opts)
map('n', '<leader>gf', builtin.diagnostics, opts)
map('n', '<leader>qf', builtin.quickfix, opts)
map('n', '<C-g>', function()
    vim.fn.system('git rev-parse --is-inside-work-tree')
    if vim.v.shell_error == 0 then
      require "telescope.builtin".git_files(opts)
    else
      print("Not a Git directory")
    end
  end,
  opts)
