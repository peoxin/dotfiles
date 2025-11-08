return {
	"MagicDuck/grug-far.nvim",
	keys = {
		-- stylua: ignore
		{ "<Leader>sR", mode = { "n", "v" }, function() require("grug-far").open() end, desc = "Replace in files" },
	},
	opts = {},
}
