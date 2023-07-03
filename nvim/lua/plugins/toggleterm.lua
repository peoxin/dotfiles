local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
	return
end

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap({ "n", "t" }, "<C-]>", [[<Cmd>ToggleTermToggleAll<CR>]], opts)
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)

toggleterm.setup({
	open_mapping = [[<C-\>]],
	autochdir = false,
	direction = "horizontal",
})
