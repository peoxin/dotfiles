return {
	"nvim-treesitter/nvim-treesitter",
	event = "BufEnter",
	main = "nvim-treesitter.configs",
	init = function()
		-- Folding based on treesitter
		vim.wo.foldenable = false
		vim.wo.foldmethod = "expr"
		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
	end,
	opts = {
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
