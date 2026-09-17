return {
	"stevearc/conform.nvim",
	event = "VeryLazy",
	keys = {
        -- stylua: ignore
		{ "<Leader>cf", function() require("conform").format({ async = true }) end, desc = "Format file" },
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			sh = { "shfmt" },
			just = { "just" },
			python = { "ruff_organize_imports", "ruff_format" },
			rust = { "rustfmt" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			yaml = { "prettierd" },
			toml = { "taplo" },
			markdown = { "prettierd" },
			qml = { "qmlformat" },
			-- filetypes not specifically configured
			["_"] = { "trim_newlines", "trim_whitespace" },
		},
		default_format_opts = {
			lsp_format = "never",
		},
		format_on_save = {
			timeout_ms = 500,
		},
	},
}
