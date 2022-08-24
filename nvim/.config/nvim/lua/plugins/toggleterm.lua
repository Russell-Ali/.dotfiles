require("toggleterm").setup{
  size = 20,
  open_mapping = [[<A-t>]],
  direction = 'float',
  float_opts = {
    border = 'curved',
    -- | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    width = 80,
    height = 20,
    winblend = 3,
  },
}
