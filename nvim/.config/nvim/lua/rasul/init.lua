require('rasul.options')
require('rasul.keymaps')
require('rasul.plugins')

-- Set colorscheme
vim.cmd [[colorscheme github_dark]]

-- Variables
local autocmd = vim.api.nvim_create_autocmd

-- Clean default format on BufEnter
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o',
})

-- Highlight yanked text
autocmd('TextYankPost', {
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 40,
    })
  end,
})

-- Remove whitespace before saving on BufWritePre
autocmd('BufWritePre', {
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Format on save with LSP on BufWritePre
autocmd('BufWritePre', {
  pattern = '*',
  command = 'lua vim.lsp.buf.format()',
})
