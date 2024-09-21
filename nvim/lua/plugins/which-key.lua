return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	init = function()
		-- Decrease mapped sequence wait time to display which-key popup sooner
		vim.o.timeout = true
		vim.opt.timeoutlen = 300
	end,
	opts = {},
}
