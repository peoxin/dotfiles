return {
	"iamcco/markdown-preview.nvim",
	build = "cd app && npm install && git restore .",
	init = function()
		vim.g.mkdp_filetypes = { "markdown" }
	end,
	keys = { { "<Leader>md", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview" } },
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
}
