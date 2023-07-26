return {
	"catppuccin/nvim",
	enabled = true,
	opts = {
		flavour = "macchiato", -- latte, frappe, macchiato, mocha
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
			loops = {},
			functions = {},
			keywords = {},
			strings = {},
			variables = {},
			numbers = {},
			booleans = {},
			properties = {},
			types = {},
			operators = {},
		},
		color_overrides = {},
		custom_highlights = {},
		integrations = {
			gitsigns = true,
			nvimtree = true,
			telescope = true,
			indent_blankline = { enabled = true },
			illuminate = true,
			leap = true,
			treesitter = true,
			markdown = true,
			mason = true,
			navic = { enabled = true, custom_bg = "lualine" },
			cmp = true,
			which_key = true,
			native_lsp = {
				enabled = true,
				virtual_text = {
					errors = { "italic" },
					hints = { "italic" },
					warnings = { "italic" },
					information = { "italic" },
				},
				underlines = {
					errors = { "underline" },
					hints = { "underline" },
					warnings = { "underline" },
					information = { "underline" },
				},
				inlay_hints = {
					background = true,
				},
			},
		},
	},
	config = function(_, opts)
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin")
	end,
}
