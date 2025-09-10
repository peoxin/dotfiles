return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		-- flavours: latte, frappe, macchiato, mocha
		flavour = "macchiato",
		transparent_background = not vim.g.neovide,
		auto_integrations = true,
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin")
	end,
}
