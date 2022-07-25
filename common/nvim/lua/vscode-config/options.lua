-- Options for VSCode Neovim

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Add `-` to `iskeyword` to treat dash-separated words as single words
vim.opt.iskeyword:append("-")

-- Sync clipboard between neovim and OS
-- Schedule the setting after `UiEnter` because it can increase startup-time
-- For linux: install clipboard tools first
vim.schedule(function()
	vim.opt.clipboard:append("unnamedplus")
end)
