return {
	"MagicDuck/grug-far.nvim",
	keys = {
        -- stylua: ignore start
		{ "<Leader>sR", mode={ "n", "v" }, function() require("grug-far").open() end, desc = "Replace in files" },
		-- stylua: ignore end
	},
	opts = {},
}
