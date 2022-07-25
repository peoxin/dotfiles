return {
	"catppuccin/nvim",
	opts = {
		-- flavours: latte, frappe, macchiato, mocha
		flavour = "macchiato",
		styles = {
			comments = { "italic" },
			conditionals = { "italic" },
		},
		transparent_background = true,
		integrations = {
			aerial = true,
			blink_cmp = true,
			flash = true,
			gitsigns = true,
			illuminate = { enabled = true },
			markdown = true,
			mason = true,
			treesitter = true,
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
			snacks = {
				enabled = true,
				indent_scope_color = "text",
			},
		},
	},
	config = function(_, opts)
		-- Disable transparent background if using neovide.
		if vim.g.neovide then
			opts.transparent_background = false
		end
		require("catppuccin").setup(opts)
		vim.cmd("colorscheme catppuccin")
	end,
}
