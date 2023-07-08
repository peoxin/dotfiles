return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		modes = {
			search = { enabled = false },
		},
	},
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
			mode = { "n", "x", "o" },
			desc = "Flash",
		},
		{
			"S",
			function()
				require("flash").treesitter()
			end,
			mode = { "n", "o", "x" },
			desc = "Flash Treesitter",
		},
	},
}
