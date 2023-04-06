local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.keymap.set

-- Map space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Split window
keymap("n", "<Leader>sv", ":vsplit<CR>", opts)
keymap("n", "<Leader>sh", ":split<CR>", opts)

-- Faster window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Close window
keymap("n", "<S-q>", ":q<CR>", opts)

-- Join two lines
keymap("n", "<Leader>j", "<S-j>", opts)

-- Faster curse up and down
keymap("n", "<S-j>", "5j", opts)
keymap("n", "<S-k>", "5k", opts)

-- Clear highlights
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)

-- Visual --
-- Change indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-j>", ":move '>+1<CR>gv=gv", opts)
keymap("v", "<C-k>", ":move '<-2<CR>gv=gv", opts)

-- Join lines
keymap("v", "<Leader>j", "<S-j>", opts)

-- Faster curse up and down
keymap("v", "<S-j>", "5j", opts)
keymap("v", "<S-k>", "5k", opts)

-- Better paste
keymap("v", "p", '"_dP', opts)

-- Plugins --
-- Nvim-tree
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>") -- find files in current working directory
keymap("n", "<leader>fa", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>") -- find all files
keymap("n", "<leader>fg", ":Telescope live_grep<CR>") -- find string in current working directory
keymap("n", "<leader>fb", ":Telescope buffers<CR>") -- list open buffers in current neovim instance
keymap("n", "<leader>fh", ":Telescope help_tags<CR>") -- list available help tags

-- Markdown preview
keymap("n", "<Leader>md", ":MarkdownPreviewToggle<CR>")
