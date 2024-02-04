local variable
require('lualine').setup {
  options = {
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'TelescopePrompt', 'NvimTree' },
    },
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff' },
    lualine_c = { 'filename', 'diagnostics' },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'selectioncount' }
  },
}
