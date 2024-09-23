return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    event = "BufEnter",
    init = function()
        -- Fold code based on treesitter syntax
        vim.opt.foldenable = false
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
    end,
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        auto_install = true,
        ensure_installed = {
            "cpp",
            "python",
            "rust",
            "lua",
            "javascript",
            "typescript",
            "bash",
            "html",
            "css",
            "json",
            "yaml",
            "markdown",
            "gitignore",
        },
    },
}
