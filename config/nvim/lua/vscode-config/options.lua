-- Options for VSCode Neovim

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Case-insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Sync clipboard between neovim and OS
vim.opt.clipboard:append("unnamedplus")
