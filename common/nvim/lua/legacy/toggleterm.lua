return {
	"akinsho/toggleterm.nvim",
	-- Set `event` to `VeryLazy` to prepare the custom terminals after nvim startup
	event = "VeryLazy",
	keys = {
		-- Press `Ctrl-D` to exit terminal
		{
			"<Leader>tf",
			"<cmd>ToggleTerm direction=float<CR>",
			desc = "Float terminal",
		},
		{
			"<Leader>t-",
			"<cmd>ToggleTerm direction=horizontal<CR>",
			desc = "Horizontal terminal",
		},
		{
			"<Leader>t\\",
			"<cmd>ToggleTerm direction=vertical<CR>",
			desc = "Vertical terminal",
		},
		{
			"<Leader>rp",
			"<cmd>TermExec cmd='python %' direction=float<CR>",
			desc = "Run python file",
		},
		{
			"<Leader>rP",
			"<cmd>TermExec cmd='source .venv/bin/activate && python %' direction=float<CR>",
			desc = "Run python file in venv",
		},
	},
	opts = {
		-- Don't change directory in terminal when
		-- neovim changes its current working directory
		autochdir = false,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)

		-- A function using `toggleterm` to create a terminal
		local function create_terminal(cmd, count)
			local Terminal = require("toggleterm.terminal").Terminal
			return Terminal:new({ cmd = cmd, direction = "float", count = count, hidden = true })
		end

		-- Create a terminal for gitui
		local gitui = create_terminal("gitui", 9)
		function _gitui_toggle()
			gitui:toggle()
		end

		vim.keymap.set("n", "<Leader>tg", "<cmd>lua _gitui_toggle()<CR>", { desc = "GitUI" })

		-- Create a terminal for bottom
		local bottom = create_terminal("btm", 0)
		function _bottom_toggle()
			bottom:toggle()
		end

		vim.keymap.set("n", "<Leader>tb", "<cmd>lua _bottom_toggle()<CR>", { desc = "Bottom" })
	end,
}
