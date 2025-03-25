return {
	"stevearc/conform.nvim",
	event = "BufEnter",
	keys = {
        -- stylua: ignore start
		{ "<Leader>cf", function() require("conform").format({ async = true }) end, desc = "Format file" },
		-- stylua: ignore end
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_organize_imports", "ruff_format" },
			rust = { "rustfmt", lsp_format = "fallback" },
			javascript = { "prettier" },
			sh = { "shfmt" },
			yaml = { "prettier" },
			toml = { "taplo" },
			markdown = { "prettier" },
			-- "_" means filetypes that don't have other formatters configured
			["_"] = { "trim_newlines", "trim_whitespace" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
