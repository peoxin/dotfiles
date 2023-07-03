local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

treesitter.setup({
	highlight = {
		enable = true,
	},

	indent = { enable = true, disable = { "python" } },

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
})
