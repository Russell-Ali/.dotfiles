-- Getting HOME variable for relative path
local HOME = os.getenv('HOME')

-- List of options
local options = {
  number = true,
  relativenumber = true,
  mouse = 'nv',
  guicursor = '',
  colorcolumn = '100',
  tabstop = 2,
  shiftwidth = 2,
  expandtab = true,
  errorbells = false,
  swapfile = false,
  undodir = HOME .. '/.local/share/nvim/undo',
  undofile = true,
  wrap = false,
  scrolloff = 8,
  smartindent = true,
  hlsearch = false,
  showmode = false,
  signcolumn = 'yes',
  laststatus = 3,
  ignorecase = true,
  smartcase = true,
  filetype = 'on',
  spelllang = 'en_us',
  spellsuggest = { 'best', 9 },
  updatetime = 400,
  termguicolors = true,
  completeopt = { 'menu', 'menuone', 'noselect' },
  cursorline = true,
  splitright = true,
  splitbelow = true,
  syntax = 'ON',
  title = true,
  inccommand = 'split',
  cmdheight = 0,
  showcmdloc = 'statusline',
}
-- Function to set from table above
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- List of options to append to the defaults
local appends = {
  complete = 'kspell',
  fillchars = [[eob: ]],
  wildignore = '*/node_modules/*',
  path = '**',
}
-- Function to append from table above
for k, v in pairs(appends) do
  vim.opt[k]:append(v)
end
