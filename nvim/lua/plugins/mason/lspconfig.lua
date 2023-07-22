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
				local function opts(desc)
					return { desc = desc, buffer = ev.buf }
				end
				keymap("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
				keymap("n", "gD", vim.lsp.buf.declaration, opts("Go to declaration"))
				keymap("n", "gI", vim.lsp.buf.implementation, opts("Go to implementation"))
				keymap("n", "gr", vim.lsp.buf.references, opts("Find all references"))
				keymap("n", "gT", vim.lsp.buf.type_definition, opts("Go to type definition"))
				keymap("n", "gk", vim.lsp.buf.hover, opts("Hover"))
				keymap("n", "gH", vim.lsp.buf.signature_help, opts("Signature help"))
				keymap("n", "<Leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
				keymap("n", "<Leader>ca", vim.lsp.buf.code_action, opts("Code action"))
				keymap("n", "<Leader>fm", function()
					vim.lsp.buf.format({ async = true })
				end, opts("Format file"))
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
