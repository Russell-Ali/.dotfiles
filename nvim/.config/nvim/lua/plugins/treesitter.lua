require 'nvim-treesitter.configs'.setup {
    auto_install = true,
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = '<CR>',
            scope_incremental = '<CR>',
            node_incremental = '<TAB>',
            node_decremental = '<S-TAB>',
        },
    },
}
