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
			sh = { "shfmt" },
			just = { "just" },
			python = { "ruff_organize_imports", "ruff_format" },
			rust = { "rustfmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			toml = { "taplo" },
			markdown = { "prettier" },
			qml = { "qmlformat" },
			-- "_" means filetypes that don't have other formatters configured
			["_"] = { "trim_newlines", "trim_whitespace" },
		},
		default_format_opts = {
			lsp_format = "never",
		},
		format_on_save = {
			timeout_ms = 500,
		},
		formatters = {
			qmlformat = {
				command = "qmlformat",
				args = { "-i", "$FILENAME" },
				stdin = false,
			},
		},
	},
}
