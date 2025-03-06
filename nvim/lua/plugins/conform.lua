return {
	"stevearc/conform.nvim",
	event = "BufEnter",
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettierd", "prettier", stop_after_first = true },
			-- "_" means filetypes that don't have other formatters configured.
			["_"] = { "trim_newlines", "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
