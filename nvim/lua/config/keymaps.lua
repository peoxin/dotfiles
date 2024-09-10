-- Map space as leader key
vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc, noremap = true, silent = true })
end

-- Normal Mode --
-- Window management --
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
map("n", "<C-w>h", "<C-w>H", "Move window to left")
map("n", "<C-w>j", "<C-w>J", "Move window to down")
map("n", "<C-w>k", "<C-w>K", "Move window to up")
map("n", "<C-w>l", "<C-w>L", "Move window to right")
map("n", "<C-q>", ":q<CR>", "Close window")
-- Buffer management --
map("n", "<S-l>", ":bnext<CR>", "Move to next buffer")
map("n", "<S-h>", ":bprevious<CR>", "Move to previous buffer")
map("n", "<S-q>", ":bd<CR>", "Close buffer")
-- Editing --
map("n", "<S-j>", "5j", "Faster up")
map("n", "<S-k>", "5k", "Faster down")
map("n", "<Leader>j", "<S-j>", "Join two lines")
map("n", "<Leader>h", ":nohlsearch<CR>", "Clear highlights")
map("n", "<C-s>", ":w<CR>", "Save file")

-- Visual Mode --
map("v", "<", "<gv", "Less indent")
map("v", ">", ">gv", "More indent")
map("v", "<A-j>", ":move '>+1<CR>gv=gv", "Move lines up")
map("v", "<A-k>", ":move '<-2<CR>gv=gv", "Move lines down")
map("v", "<S-j>", "5j", "Faster up")
map("v", "<S-k>", "5k", "Faster down")
map("v", "<Leader>j", "<S-j>", "Join lines")
map("v", "p", '"_dP', "Paste")
