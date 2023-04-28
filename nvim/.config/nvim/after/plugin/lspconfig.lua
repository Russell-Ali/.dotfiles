local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
local lsp = require('lspconfig')
local map = vim.keymap.set

-- Mappings.

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { noremap = true, silent = true, buffer = ev.buf }
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', 'gi', vim.lsp.buf.implementation, opts)
    map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)
    map('n', '<leader>r', vim.lsp.buf.rename, opts)
  end,
})

-- SERVER LIST --

-- Lua
lsp.lua_ls.setup {
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
-- C/C++
lsp.clangd.setup {}
-- Python
lsp.pyright.setup {}
-- JS/TS/Svelte
lsp.eslint.setup {}
-- Rust
lsp.rust_analyzer.setup {}
-- Tailwind
lsp.tailwindcss.setup {}
-- Css/SCss/Less
lsp.cssls.setup {}
-- Sh
lsp.bashls.setup {}
-- Dart
lsp.dartls.setup {}
-- Json
lsp.jsonls.setup {}
-- Dart
lsp.dartls.setup {}
-- Svelte
lsp.svelte.setup {}
-- Typescript
lsp.tsserver.setup {}
