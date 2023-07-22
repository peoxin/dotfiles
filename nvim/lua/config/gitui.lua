local Terminal = require("toggleterm.terminal").Terminal
local gitui =
	Terminal:new({ cmd = "gitui", direction = "float", float_opts = { border = "single" }, count = 9, hidden = true })

function _gitui_toggle()
	gitui:toggle()
end

vim.api.nvim_set_keymap(
	"n",
	"<leader>gg",
	"<cmd>lua _gitui_toggle()<CR>",
	{ desc = "GitUI", noremap = true, silent = true }
)
