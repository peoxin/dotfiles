return {
	"folke/flash.nvim",
	event = "BufEnter",
	keys = {
		{
			"s",
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
		{
			"S",
			function()
				require("flash").treesitter()
			end,
			desc = "Flash Treesitter",
		},
	},
	opts = {
		modes = {
			search = { enabled = false },
		},
	},
}
