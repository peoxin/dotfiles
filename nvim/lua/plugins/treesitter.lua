return {
    "nvim-treesitter/nvim-treesitter",
    main = "nvim-treesitter.configs",
    event = "BufEnter",
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
