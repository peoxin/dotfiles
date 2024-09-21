return {
    "SmiteshP/nvim-navic",
    enabled = false,
    event = "BufEnter",
    dependencies = { "neovim/nvim-lspconfig" },
    opts = {
        separator = " > ",
        highlight = true,
        lsp = {
            auto_attach = false,
        },
        click = true,
    },
}
