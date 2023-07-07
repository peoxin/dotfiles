local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
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
	"catppuccin/nvim",

	-- Leap
	-- "ggandor/leap.nvim",

	-- Flash
	{ import = "plugins.flash" },

	-- Telescope
	"nvim-telescope/telescope.nvim",

	-- Lualine
	"nvim-lualine/lualine.nvim",

	-- Nvim-tree
	"nvim-tree/nvim-tree.lua",

	-- Comment
	{ "numToStr/Comment.nvim", config = true },

	-- Surround
	{ "kylechui/nvim-surround", config = true },

	-- Treesitter
	"nvim-treesitter/nvim-treesitter",

	-- Auto completion
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",

	-- Snippets
	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	-- Autopairs
	"windwp/nvim-autopairs",

	-- LSP
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"williamboman/mason-lspconfig.nvim",

	-- Formatter and linter
	"jose-elias-alvarez/null-ls.nvim",
	"jayp0521/mason-null-ls.nvim",

	-- DAP
	"mfussenegger/nvim-dap",
	"jay-babu/mason-nvim-dap.nvim",
	"rcarriga/nvim-dap-ui",

	-- Markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- Gitsigns
	"lewis6991/gitsigns.nvim",

	-- Toggle terminal
	"akinsho/toggleterm.nvim",
})
