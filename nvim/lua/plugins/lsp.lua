return {
    "neovim/nvim-lspconfig",
    event = "BufEnter",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                -- Auto install the following language servers
                ensure_installed = {
                    "pyright",
                    "rust_analyzer",
                },
                automatic_installation = true,
            },
        },
    },
    opts = {
        servers = {
            pyright = {},
            rust_analyzer = {
                on_attach = function()
                    -- Enable inlay hints automatically when attaching to rust_analyzer
                    vim.lsp.inlay_hint.enable(true)
                end,
            },
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
                map("n", "gd", vim.lsp.buf.definition, "Go to definition")
                map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
                map("n", "gy", vim.lsp.buf.type_definition, "Go to type definition")
                map("n", "gI", vim.lsp.buf.implementation, "Go to implementation")
                map("n", "gr", vim.lsp.buf.references, "Find all references")
                -- Press `gk` again to enter the hover window
                map("n", "gk", vim.lsp.buf.hover, "Hover")
                map("n", "gH", vim.lsp.buf.signature_help, "Signature help")
                map("n", "<Leader>cr", vim.lsp.buf.rename, "Rename symbol")
                map("n", "<Leader>ca", vim.lsp.buf.code_action, "Code action")
                map("n", "<Leader>cf", function()
                    vim.lsp.buf.format({ async = true })
                end, "Format file")
                map("n", "<Leader>ci", function()
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end, "Toggle inlay hints")
            end,
        })

        -- Setup LSP servers
        for server, server_opts in pairs(opts.servers) do
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local extended_server_opts = vim.tbl_deep_extend("force", {
                capabilities = capabilities,
            }, server_opts or {})
            require("lspconfig")[server].setup(extended_server_opts)
        end
    end,
}
