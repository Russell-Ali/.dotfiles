-- Variables
local autocmd = vim.api.nvim_create_autocmd

-- Format Options
autocmd(
    "BufEnter",
    { pattern = "*", command = "set fo-=c fo-=r fo-=o" }
)

-- For editing non-code files
autocmd(
    { "BufNewFile", "BufRead" },
    { pattern = { "*.md", "*txt" },
        command = [[set spell | set wrap | nnoremap j gj | nnoremap k gk]]
    }
)

-- Automatically compile packer file on save
autocmd(
    { "BufWritePost" },
    { pattern = "*/.config/nvim/*.lua",
        command = [[source <afile> | PackerCompile]]
    }
)

-- Format on save
autocmd(
    { "BufWritePre" },
    { pattern = "*",
        command = [[lua vim.lsp.buf.formatting_sync()]]
    })
