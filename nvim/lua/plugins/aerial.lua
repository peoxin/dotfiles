return {
    "stevearc/aerial.nvim",
    event = "BufEnter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },
    keys = {
        { "<leader>cs", "<cmd>AerialToggle!<CR>", desc = "Toggle Symbols outline" },
    },
    opts = {
        on_attach = function(bufnr)
            -- Jump forwards and backwards between code blocks
            vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
            vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
    },
}
