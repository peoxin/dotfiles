return {
	"nvim-mini/mini.surround",
	event = "VeryLazy",
	opts = {
		mappings = {
			add = "ys",
			delete = "ds",
			replace = "cs",
			find = "",
			find_left = "",
			highlight = "",
			update_n_lines = "",
			suffix_last = "",
			suffix_next = "",
		},
		silent = true,
	},
	config = function(_, opts)
		local surround = require("mini.surround")
		surround.setup(opts)

		-- Remap keybindings for visual mode
		vim.keymap.del("x", "ys")
		vim.keymap.set("x", "as", [[:<C-u>lua MiniSurround.add('visual')<CR>]])
	end,
}
