return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	opts = {
		servers = {
			pyright = {},
			rust_analyzer = {},
		},
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				local function map(mode, l, r, desc)
					vim.keymap.set(mode, l, r, { buffer = ev.buf, desc = desc })
				end
				map("n", "gd", vim.lsp.buf.definition, "Go to definition")
				map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
				map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
				map("n", "gr", vim.lsp.buf.references, "Find all references")
				map("n", "gT", vim.lsp.buf.type_definition, "Go to type definition")
				map("n", "gk", vim.lsp.buf.hover, "Hover")
				map("n", "gH", vim.lsp.buf.signature_help, "Signature help")
				map("n", "<Leader>rn", vim.lsp.buf.rename, "Rename symbol")
				map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code action")
				map("n", "<Leader>fm", function()
					vim.lsp.buf.format({ async = true })
				end, "Format file")
			end,
		})

		local function setup_server(server, server_opts)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local navic = require("nvim-navic")
			local on_attach = function(client, bufnr)
				if client.server_capabilities.documentSymbolProvider then
					navic.attach(client, bufnr)
				end
			end
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = capabilities,
				on_attach = on_attach,
			}, servers_opts or {})
			require("lspconfig")[server].setup(server_opts)
		end

		local servers = opts.servers
		for server, server_opts in pairs(servers) do
			setup_server(server, server_opts)
		end
	end,
}
