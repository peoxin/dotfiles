-- import nvim-treesitter plugin safely
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},

	-- enable indentation
	indent = { enable = true, disable = { "python" } },

	-- ensure these language parsers are installed
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

	-- auto install above language parsers
	auto_install = true,
})
