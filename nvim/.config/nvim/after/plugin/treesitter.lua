require 'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
  },
}
