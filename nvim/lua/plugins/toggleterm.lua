return {
	"akinsho/toggleterm.nvim",
	keys = {
		{
			"<C-\\>",
			[[<Cmd>ToggleTerm<CR>]],
			mode = { "n", "t" },
			desc = "Toggle terminal",
		},
		{
			"<C-]>",
			[[<Cmd>ToggleTermToggleAll<CR>]],
			mode = { "n", "t" },
			desc = "Toggle all terminal",
		},
		{
			"<C-h>",
			[[<Cmd>wincmd h<CR>]],
			mode = "t",
			desc = "Go to left window",
		},
		{
			"<C-j>",
			[[<Cmd>wincmd j<CR>]],
			mode = "t",
			desc = "Go to down window",
		},
		{
			"<C-k>",
			[[<Cmd>wincmd k<CR>]],
			mode = "t",
			desc = "Go to up window",
		},
		{
			"<C-l>",
			[[<Cmd>wincmd l<CR>]],
			mode = "t",
			desc = "Go to right window",
		},
	},
	opts = {
		open_mapping = [[<C-\>]],
		autochdir = false,
		direction = "horizontal",
	},
}
