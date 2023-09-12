-- Variables
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Autocommand Groups
augroup("Format Preferences", { clear = true })
-- Clean default format
autocmd(
  "BufEnter",
  { pattern = "*", command = "set fo-=c fo-=r fo-=o" }
)
-- For editing non-code files
autocmd(
  { "BufNewFile", "BufRead" },
  {
    pattern = { "*.md", "*txt" },
    command = [[set spell | set wrap | nnoremap j gj | nnoremap k gk]]
  }
)
-- Format on save
autocmd(
  { "BufWritePre" },
  {
    pattern = "*",
    command = [[lua vim.lsp.buf.format()]]
  })
