return {
	"yetone/avante.nvim",
	enabled = false,
	event = "VeryLazy",
	build = "make",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
		"hrsh7th/nvim-cmp", -- Autocompletion for avante commands and mentions
		"zbirenbaum/copilot.lua", -- For provider copilot
		{
			"MeanderingProgrammer/render-markdown.nvim",
			opts = {
				file_types = { "Avante" },
			},
			ft = { "Avante" },
		},
	},
	opts = {
		provider = "copilot",
		behaviour = {
			auto_suggestions = false, -- Use copilot.lua for auto suggestions
		},
	},
}
