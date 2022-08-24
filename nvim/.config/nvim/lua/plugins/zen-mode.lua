require("zen-mode").setup {
  window = {
    backdrop = 1,
    height = 1,
    width = 80,
    options = {
      signcolumn = "no",
      statusline = "laststatus=0",
      number = false,
      relativenumber = false,
    },
  plugins = {
    options = {
      enabled = true,
    },
    twilight = { enabled = false },
  },
  },
}

vim.api.nvim_set_keymap("n", "<leader>zz", ":ZenMode<cr>", {noremap = true, silent = true})
