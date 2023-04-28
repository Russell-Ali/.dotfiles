-- Variables
local dap = require('dap')
local opts = { noremap = true, silent = true }
local map = vim.keymap.set

-- Mappings
map('n', '<leader>b', dap.toggle_breakpoint, opts)
map('n', '<leader>n', dap.continue, opts)
map('n', '<leader>do', function() require('dap').step_over() end)
map('n', '<leader>di', function() require('dap').step_into() end)
map('n', '<leader>dO', function() require('dap').step_out() end)
map('n', '<Leader>dr', function() require('dap').repl.open() end)
