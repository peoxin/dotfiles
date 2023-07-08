return {
	"nvim-treesitter/nvim-treesitter",
	main = "nvim-treesitter.configs",
	opts = {
		highlight = { enable = true },
		indent = { enable = true },
		ensure_installed = {
			"cpp",
			"rust",
			"python",
			"json",
			"javascript",
			"typescript",
			"yaml",
			"html",
			"css",
			"markdown",
			"bash",
			"lua",
			"gitignore",
		},
		auto_install = true,
	},
}
