return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.add({
			{ "<leader>a", group = "AI" },
			{ "<leader>b", group = "Buffer" },
			{ "<Leader>c", group = "Code" },
			{ "<Leader>f", group = "Find" },
			{ "<Leader>g", group = "Git" },
			{ "<Leader>s", group = "Search" },
			{ "<Leader>t", group = "Terminal" },
		})
		wk.setup(opts)
	end,
}
