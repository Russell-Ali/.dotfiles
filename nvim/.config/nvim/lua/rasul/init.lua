require("rasul.options")
require("rasul.keymaps")
require("rasul.lazy")

-- Variables
local autocmd = vim.api.nvim_create_autocmd

-- Clean default format on BufEnter
autocmd("BufEnter", {
	pattern = "*",
	command = "set fo-=c fo-=r fo-=o",
})

-- Highlight yanked text
autocmd("TextYankPost", {
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 40,
		})
	end,
})

-- Remove whitespace before saving on BufWritePre
autocmd("BufWritePre", {
	pattern = "*",
	command = [[%s/\s\+$//e]],
})
