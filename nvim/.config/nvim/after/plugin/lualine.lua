require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = {
      statusline = { 'NvimTree', 'toggleterm' },
    },
    ignore_focus = { 'NvimTree', 'toggleterm' },
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 100,
    }
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { { 'branch', icon = '' }, 'diff', 'diagnostics' },
    lualine_c = {
      { 'filename',
        filestatus = true,
        symbols = {
          modified = '[+]',
          readonly = '[]',
          unnamed = '[No Name]',
          newfile = '[New]',
        }
      }
    },
    lualine_x = { 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
}
