local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	return
end

-- Install plugins
lazy.setup({
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",

	-- Colorschemes
	"folke/tokyonight.nvim",

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Lualine
	"nvim-lualine/lualine.nvim",

	-- Nvim-tree
	{
		"nvim-tree/nvim-tree.lua",
		tag = "nightly",
	},

	-- Comment
	"numToStr/Comment.nvim",

	-- Surround
	"kylechui/nvim-surround",

	-- Treesitter
	"nvim-treesitter/nvim-treesitter", -- Syntax hightlighting

	-- Autocompletion
	"hrsh7th/nvim-cmp", -- completion plugin
	"hrsh7th/cmp-buffer", -- source for text in buffer
	"hrsh7th/cmp-path", -- source for file system paths
	"saadparwaiz1/cmp_luasnip", -- source for luasnip
	"hrsh7th/cmp-nvim-lsp", -- source for lsp

	-- Autopairs
	"windwp/nvim-autopairs",

	-- Snippets
	"L3MON4D3/LuaSnip", -- snippet engine
	"rafamadriz/friendly-snippets", -- useful snippets

	-- LSP
	"neovim/nvim-lspconfig",
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- Formatter and linter
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- Git
	"lewis6991/gitsigns.nvim",
})
