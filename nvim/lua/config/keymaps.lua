-- Map space as leader key
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc, noremap = true, silent = true })
end

-- Normal Mode --
map("n", "<Leader>sv", ":vsplit<CR>", "vsplit window")
map("n", "<Leader>sh", ":split<CR>", "split window")

map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-j>", "<C-w>j", "Move to down window")
map("n", "<C-k>", "<C-w>k", "Move to up window")
map("n", "<C-l>", "<C-w>l", "Move to right window")

map("n", "<C-Up>", ":resize +2<CR>", "Resize window (+height)")
map("n", "<C-Down>", ":resize -2<CR>", "Resize window (-height)")
map("n", "<C-Left>", ":vertical resize -2<CR>", "Resize window (-width)")
map("n", "<C-Right>", ":vertical resize +2<CR>", "Resize window (+width)")

map("n", "<S-l>", ":bnext<CR>", "Move to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Move to previous buffer")

map("n", "<C-q>", ":q<CR>", "Close window")
map("n", "<S-q>", ":bd<CR>", "Close buffer")

map("n", "<C-s>", ":w<CR>", "Save file")

map("n", "<Leader>j", "<S-j>", "Join two lines")

map("n", "<S-j>", "5j", "Faster up")
map("n", "<S-k>", "5k", "Faster down")

map("n", "<Leader>h", ":nohlsearch<CR>", "Clear highlights")

-- Visual Mode --
map("v", "<", "<gv", "Less indent")
map("v", ">", ">gv", "More indent")

map("v", "<A-j>", ":move '>+1<CR>gv=gv", "Move lines up")
map("v", "<A-k>", ":move '<-2<CR>gv=gv", "Move lines down")

map("v", "<Leader>j", "<S-j>", "Join lines")

map("v", "<S-j>", "5j", "Faster up")
map("v", "<S-k>", "5k", "Faster down")

map("v", "p", '"_dP', "Paste")
