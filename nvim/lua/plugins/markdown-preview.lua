return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	keys = { { "<Leader>md", ":MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview" } },
	ft = { "markdown" },
}
