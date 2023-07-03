local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
	return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		local keymap = vim.keymap.set

		keymap("n", "gd", vim.lsp.buf.definition, opts)
		keymap("n", "gD", vim.lsp.buf.declaration, opts)
		keymap("n", "gi", vim.lsp.buf.implementation, opts)
		keymap("n", "gr", vim.lsp.buf.references, opts)
		keymap("n", "gh", vim.lsp.buf.hover, opts)
		keymap("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
		keymap("n", "<Leader>K", vim.lsp.buf.signature_help, opts)

		keymap("n", "<Leader>wa", vim.lsp.buf.add_workspace_folder, opts)
		keymap("n", "<Leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
		keymap("n", "<Leader>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)

		keymap("n", "<Leader>rn", vim.lsp.buf.rename, opts)
		keymap("n", "<Leader>ca", vim.lsp.buf.code_action, opts)
		keymap("n", "<Leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

-- Setup pyright
lspconfig.pyright.setup({
	capabilities = capabilities,
	settings = {
		pyright = {
			autoImportCompletion = true,
			python = {
				analysis = {
					autoSearchPaths = true,
					useLibraryCodeForTypes = true,
				},
			},
		},
	},
})

-- Setup rust-analyzer
lspconfig.rust_analyzer.setup({
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {},
	},
})
