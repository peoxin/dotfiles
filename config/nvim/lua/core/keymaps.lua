-- Shortcut for the keymap function
local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc, noremap = true, silent = true })
end

-- Normal Mode --
-- Window management --
map("n", "<C-\\>", "<cmd>vsplit<CR>", "Split window right")
map("n", "<C-->", "<cmd>split<CR>", "Split window down")
map("n", "<C-h>", "<C-w>h", "Focus on left window")
map("n", "<C-j>", "<C-w>j", "Focus on down window")
map("n", "<C-k>", "<C-w>k", "Focus on up window")
map("n", "<C-l>", "<C-w>l", "Focus on right window")
map("n", "<C-Up>", "<cmd>resize +2<CR>", "Increase window height")
map("n", "<C-Down>", "<cmd>resize -2<CR>", "Decrease window height")
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", "Decrease window width")
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", "Increase window width")
map("n", "<C-w>h", "<C-w>H", "Move window to left")
map("n", "<C-w>j", "<C-w>J", "Move window to down")
map("n", "<C-w>k", "<C-w>K", "Move window to up")
map("n", "<C-w>l", "<C-w>L", "Move window to right")
map("n", "<C-q>", "<cmd>q<CR>", "Close window")
-- Buffer management --
map("n", "<S-h>", "<cmd>bprevious<CR>", "Go to previous buffer")
map("n", "<S-l>", "<cmd>bnext<CR>", "Go to next buffer")
map("n", "<S-q>", "<cmd>bd<CR>", "Close buffer")
-- Editing --
map("n", "<S-j>", "5j", "Faster down")
map("n", "<S-k>", "5k", "Faster up")
map("n", "<A-j>", "<cmd>move .+1<CR>==", "Move line down")
map("n", "<A-k>", "<cmd>move .-2<CR>==", "Move line up")
map("n", ";", "<S-j>", "Join two lines")
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear highlights")
map("n", "<C-s>", "<cmd>w<CR>", "Save file")
map("n", "<Leader>cw", "<cmd>noautocmd w<CR>", "Save file (without formatting)")

-- Visual Mode --
map("v", "<S-j>", "5j", "Faster down")
map("v", "<S-k>", "5k", "Faster up")
map("v", "<A-j>", "<cmd>move '>+1<CR>gv=gv", "Move lines down")
map("v", "<A-k>", "<cmd>move '<-2<CR>gv=gv", "Move lines up")
map("v", "<", "<gv", "Decrease indent")
map("v", ">", ">gv", "Increase indent")
map("v", ";", "<S-j>", "Join lines")
map("v", "p", '"_dP', "Paste")
