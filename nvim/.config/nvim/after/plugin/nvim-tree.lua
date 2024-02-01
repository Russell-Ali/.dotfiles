require("nvim-tree").setup {
  git = {
    ignore = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
  filters = {
    dotfiles = false,
  },
}

vim.api.nvim_set_keymap("n", "<A-n>", ":NvimTreeToggle<cr>", { noremap = true, silent = true })
