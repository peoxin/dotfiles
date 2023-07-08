return {
	{ "williamboman/mason.nvim", opts = {} },
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"pyright",
				"rust_analyzer",
			},
			automatic_installation = true,
		},
	},
	{
		"jayp0521/mason-null-ls.nvim",
		opts = {
			ensure_installed = {
				"prettier",
				"stylua",
				"black",
				"rustfmt",
			},
			automatic_installation = true,
		},
	},
	{
		"jay-babu/mason-nvim-dap.nvim",
		opts = {
			ensure_installed = {
				"python",
				"cppdbg",
			},
			automatic_installation = true,
			automatic_setup = true,
			handlers = {},
		},
	},
}
