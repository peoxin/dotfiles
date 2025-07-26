return {
	"mikavilpas/yazi.nvim",
	event = "VeryLazy",
	keys = {
        -- stylua: ignore start
		{ "<Leader>y", "<cmd>Yazi<CR>", desc = "Yazi" },
		{ "<Leader>Y", "<cmd>Yazi cwd<CR>", desc = "Yazi (cwd)" },
		-- stylua: ignore end
	},
	opts = {},
}
