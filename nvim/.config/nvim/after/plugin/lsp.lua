-- Ensure to setup Mason before lspconfig
require("mason").setup({
  ensure_isntalled = {
    "prettierd",
  },
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  },
})

require("mason-lspconfig").setup {
  automatic_installation = true,
}

local lsp = require('lspconfig')
local map = vim.keymap.set

local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end


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
-- Rust
lsp.rust_analyzer.setup {}
-- Tailwind
lsp.tailwindcss.setup {}
-- Sh
lsp.bashls.setup {}
-- Json
lsp.jsonls.setup {}
-- Svelte
lsp.svelte.setup {}
-- Typescript
lsp.tsserver.setup {}
