return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	event = "BufEnter",
	init = function()
		-- Folding based on treesitter
		vim.wo.foldenable = false
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		auto_install = true,
		ensure_installed = {
			"lua",
			"python",
			"rust",
			"cpp",
			"javascript",
			"typescript",
			"bash",
			"html",
			"css",
			"json",
			"yaml",
			"markdown",
			"gitignore",
		},
	},
}
