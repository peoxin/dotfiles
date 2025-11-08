return {
	"saghen/blink.cmp",
	version = "*",
	event = "InsertEnter",
	dependencies = "rafamadriz/friendly-snippets",
	opts = {
		fuzzy = { implementation = "prefer_rust_with_warning" },
		appearance = { nerd_font_variant = "mono" },
		completion = {
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
		},
		signature = { enabled = true },
		keymap = {
			preset = "none",
			["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
			["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
		},
		sources = {
			default = { "lsp", "buffer", "path", "snippets" },
		},
	},
	opts_extend = { "sources.default" },
}
