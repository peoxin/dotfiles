return {
	"kdheepak/lazygit.nvim",
	enabled = false,
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"nvim-lua/plenary.nvim",
	},
	keys = { { "<Leader>gg", ":LazyGitCurrentFile<CR>", desc = "Lazygit" } },
	config = function()
		require("telescope").load_extension("lazygit")
	end,
}
