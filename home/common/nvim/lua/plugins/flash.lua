return {
	"folke/flash.nvim",
	keys = {
        -- stylua: ignore start
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash treesitter" },
		-- stylua: ignore end
	},
	opts = {},
}
