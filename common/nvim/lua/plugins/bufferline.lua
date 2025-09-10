return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-mini/mini.icons",
		"catppuccin/nvim",
	},
	opts = {
		options = {
			always_show_bufferline = false,
			diagnostics = "nvim_lsp",
			hover = {
				enabled = true,
				delay = 100,
				reveal = { "close" },
			},
		},
	},
	config = function(_, opts)
		local highlights = require("catppuccin.groups.integrations.bufferline").get_theme()
		vim.tbl_deep_extend("force", opts, { highlights = highlights })
		require("bufferline").setup(opts)
	end,
}
