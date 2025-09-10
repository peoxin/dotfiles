return {
	{ "RRethy/vim-illuminate", event = "VeryLazy" },
	{ "nvim-mini/mini.pairs", event = "InsertEnter", opts = {} },
	{
		"nvim-mini/mini.icons",
		lazy = true,
		config = function()
			require("mini.icons").setup()
			MiniIcons.mock_nvim_web_devicons()
		end,
	},
	{
		"keaising/im-select.nvim",
		event = "InsertEnter",
		opts = {},
	},
	{
		"chomosuke/typst-preview.nvim",
		ft = "typst",
		opts = {},
	},
}
