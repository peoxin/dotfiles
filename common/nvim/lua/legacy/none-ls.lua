return {
    "nvimtools/none-ls.nvim",
    event = "BufEnter",
    dependencies = {
        {
            "jayp0521/mason-null-ls.nvim",
            opts = {
                -- Auto install the following formatters
                ensure_installed = {
                    "stylua",
                    "black",
                    "rustfmt",
                    "prettier",
                },
                automatic_installation = true,
            },
        },
        -- Adding this as a dependency because some of the default lsps were removed
        -- See https://github.com/nvimtools/none-ls.nvim/discussions/81 for more information
        "nvimtools/none-ls-extras.nvim",
    },
    opts = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting
        local augroup = vim.api.nvim_create_augroup("UserLspFormatting", {})
        return {
            sources = {
                formatting.black,
                formatting.stylua,
                formatting.prettier,
                require("none-ls.formatting.rustfmt")
            },
            -- Format on save
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        }
    end,
}
