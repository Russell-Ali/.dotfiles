require("nvim-tree").setup {
      git = {
        ignore = false,
      },
}

vim.api.nvim_set_keymap("n", "<A-n>", ":NvimTreeToggle<cr>", {noremap = true, silent = true})
