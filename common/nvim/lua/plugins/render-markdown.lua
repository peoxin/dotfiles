return {
	"MeanderingProgrammer/render-markdown.nvim",
	ft = { "markdown" },
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-mini/mini.icons",
	},
	opts = {
        -- stylua: ignore
		heading = {
			-- icons = { "󰝤 ", "󰝤󰝤 ", "󰝤󰝤󰝤 ", "󰝤󰝤󰝤󰝤 ", "󰝤󰝤󰝤󰝤󰝤 ", "󰝤󰝤󰝤󰝤󰝤󰝤 " },
			icons = { "# ", "## ", "### ", "#### ", "##### ", "###### " },
			signs = false,
            render_modes = true,
		},
		code = { sign = false },
		latex = { enabled = false },
		completions = {
			blink = { enabled = true },
			lsp = { enabled = true },
		},
	},
}
