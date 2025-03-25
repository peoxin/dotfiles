return {
	"neovim/nvim-lspconfig",
	event = "BufEnter",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		{
			"williamboman/mason-lspconfig.nvim",
			opts = {
				-- Auto install the following language servers
				-- This plugin use `lspconfig` server names instead of `mason.nvim` package names
				ensure_installed = {
					"pyright",
					"rust_analyzer",
					"jsonls",
					"ts_ls",
				},
				automatic_installation = true,
			},
		},
		"saghen/blink.cmp",
	},
	opts = {
		servers = {
			pyright = {},
			rust_analyzer = {
				on_attach = function()
					vim.lsp.inlay_hint.enable(true)
				end,
			},
			jsonls = {},
			ts_ls = {},
		},
	},
	config = function(_, opts)
		-- Add key bindings for LSP
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(event)
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = event.buf, desc = desc })
				end
				-- Press `gk` again to enter the hover window
				map("n", "gk", vim.lsp.buf.hover, "Hover")
				map("n", "gh", vim.diagnostic.open_float, "Line diagnostics")
				map("n", "<Leader>cr", vim.lsp.buf.rename, "Rename symbol")
				map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "<Leader>ci", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, "Toggle inlay hints")
			end,
		})

		-- Setup capabilities for LSP
		for server, config in pairs(opts.servers) do
			-- Passing config.capabilities to blink.cmp merges with the capabilities in your
			-- `opts[server].capabilities`, if you've defined it
			config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			require("lspconfig")[server].setup(config)
		end
	end,
}
