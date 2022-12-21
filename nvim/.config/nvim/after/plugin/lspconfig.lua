-- Variables
require("nvim-lsp-installer").setup {
  automatic_installation = true,
}
local lspconfig = require("lspconfig")

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
vim.lsp.protocol.make_client_capabilities().textDocument.completion.completionItem.snippetSupport = true

local map = vim.keymap.set

local bufopts = { noremap = true, silent = true, buffer = bufnr }
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  map('n', 'gD', vim.lsp.buf.declaration, bufopts)
  map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', 'gi', vim.lsp.buf.implementation, bufopts)
  map('n', '<Space>D', vim.lsp.buf.type_definition, bufopts)
  map('n', 'gr', vim.lsp.buf.references, bufopts)
  map('n', '<Space>f', vim.lsp.buf.formatting, bufopts)
  map('n', '<Space>qf', require 'telescope.builtin'.quickfix, bufopts)
end

lspconfig.sumneko_lua.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.pyright.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.cssls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.bashls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.svelte.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.tailwindcss.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

-- lspconfig.eslint.setup {
--   filetypes =
--   { "javascript", "javascriptreact", "javascript.jsx", "vue" },
--   capabilities = capabilities,
--   on_attach = on_attach
-- }

lspconfig.jsonls.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

lspconfig.tsserver.setup {
  filetypes =
  { "typescript", "typescriptreact", "typescript.tsx", "javascript", "javascriptreact", "javascript.jsx" },
  capabilities = capabilities,
  on_attach = on_attach
}
