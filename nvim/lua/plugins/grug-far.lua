return {
	"MagicDuck/grug-far.nvim",
	keys = {
        -- stylua: ignore start
		{ "<Leader>sr", mode={ "n", "v" }, function() require("grug-far").open() end, desc = "Search and replace" },
		-- stylua: ignore end
	},
	opts = {},
}
