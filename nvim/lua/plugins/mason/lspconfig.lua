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
				local keymap = vim.keymap.set
				keymap("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition", buffer = ev.buf })
				keymap("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = ev.buf })
				keymap("n", "gI", vim.lsp.buf.implementation, { desc = "Go to implementation", buffer = ev.buf })
				keymap("n", "gr", vim.lsp.buf.references, { desc = "Find all references", buffer = ev.buf })
				keymap("n", "gT", vim.lsp.buf.type_definition, { desc = "Go to type definition", buffer = ev.buf })
				keymap("n", "gk", vim.lsp.buf.hover, { desc = "Hover", buffer = ev.buf })
				keymap("n", "gH", vim.lsp.buf.signature_help, { desc = "Signature help", buffer = ev.buf })
				keymap("n", "<Leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol", buffer = ev.buf })
				keymap("n", "<Leader>ca", vim.lsp.buf.code_action, { desc = "Code action", buffer = ev.buf })
				keymap("n", "<Leader>fm", function()
					vim.lsp.buf.format({ async = true })
				end, { desc = "Format file", buffer = ev.buf })
			end,
		})

		local function setup_server(server, server_opts)
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local server_opts = vim.tbl_deep_extend("force", {
				capabilities = capabilities,
			}, servers_opts or {})
			require("lspconfig")[server].setup(server_opts)
		end

		local servers = opts.servers
		for server, server_opts in pairs(servers) do
			setup_server(server)
		end
	end,
}
