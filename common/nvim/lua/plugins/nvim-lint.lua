return {
	"mfussenegger/nvim-lint",
	event = "BufEnter",
	opts = {
		events = { "BufWritePost", "BufReadPost", "InsertLeave" },
		linters_by_ft = {
			python = { "ruff" },
		},
	},
	config = function(_, opts)
		local lint = require("lint")
		lint.linters_by_ft = opts.linters_by_ft

		local group = vim.api.nvim_create_augroup("NvimLint", { clear = true })
		for _, event in ipairs(opts.events) do
			vim.api.nvim_create_autocmd(event, {
				group = group,
				callback = function()
					lint.try_lint()
				end,
			})
		end
	end,
}
