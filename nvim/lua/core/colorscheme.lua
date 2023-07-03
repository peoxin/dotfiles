-- Tokyonight theme
-- local colorscheme = "tokyonight-moon"

-- Catppuccin theme
local colorscheme = "catppuccin"

local catppuccin_status, catppuccin = pcall(require, "catppuccin")
if not catppuccin_status then
	return
end

catppuccin.setup({
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
		leap = true,
		treesitter = true,
		markdown = true,
		mason = true,
		cmp = true,
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
		},
	},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
