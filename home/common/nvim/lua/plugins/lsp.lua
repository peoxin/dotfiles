return {
	{ "mason-org/mason.nvim", event = "VeryLazy", opts = {} },
	{
		"neovim/nvim-lspconfig",
		event = "VeryLazy",
		opts = {
			servers = {
				lua_ls = {},
				pyright = {},
				rust_analyzer = {},
				ts_ls = {},
				jsonls = {},
				marksman = {},
			},
			inlay_hint = true,
		},
		config = function(_, opts)
			-- Setup LSP servers and clients
			for server, config in pairs(opts.servers) do
				vim.lsp.config(server, config)
				vim.lsp.enable(server)
			end
			vim.lsp.inlay_hint.enable(opts.inlay_hint)

			-- Add key bindings for LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(event)
					local function map(mode, l, r, desc)
						vim.keymap.set(mode, l, r, { buffer = event.buf, desc = desc })
					end
					-- Press again to enter the hover window
					map("n", "gk", vim.lsp.buf.hover, "Hover")
					map("n", "gh", vim.diagnostic.open_float, "Line diagnostics")
					map("n", "<Leader>cr", vim.lsp.buf.rename, "Rename symbol")
					map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code action")
					map("n", "<Leader>ci", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
					end, "Toggle inlay hints")
				end,
			})
		end,
	},
}
