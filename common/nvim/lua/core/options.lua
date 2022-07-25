-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Enable mouse
vim.opt.mouse = "a"
vim.opt.mousemoveevent = true

-- Enable true colors
vim.opt.termguicolors = true

-- Disable showing messages when changing modes
vim.opt.showmode = false

-- Show which line the cursor is on
vim.opt.cursorline = true

-- Minimum number of screen lines/columns to keep around the cursor
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Set the width of the number column
vim.opt.numberwidth = 4

-- Keep the sign column open
vim.opt.signcolumn = "yes"

-- Set indent to 4 spaces
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Wrap long lines
vim.opt.wrap = true

-- Show matching brackets
vim.opt.showmatch = true

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show search results as you type
vim.opt.incsearch = true

-- Highlight search results
vim.opt.hlsearch = true

-- Configure how to split windows
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Default file encoding
vim.opt.fileencoding = "utf-8"

-- Save undo history
vim.opt.undofile = true

-- Configure file backup
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Disable auto changing directory
vim.opt.autochdir = false

-- Add `-` to `iskeyword` to treat dash-separated words as single words
vim.opt.iskeyword:append("-")

-- Sync clipboard between neovim and OS
-- Schedule the setting after `UiEnter` because it can increase startup-time
-- For linux: install clipboard tools first
vim.schedule(function()
	vim.opt.clipboard:append("unnamedplus")
end)

-- Settings for neovide
if vim.g.neovide then
	vim.o.guifont = "JetBrains Mono:h16"
	vim.g.neovide_transparency = 0.95
	vim.g.neovide_window_blurred = true
	vim.g.neovide_padding_top = 15
	vim.g.neovide_padding_bottom = 15
	vim.g.neovide_padding_left = 15
	vim.g.neovide_padding_right = 15
	vim.g.neovide_input_macos_option_key_is_meta = "both"
end
