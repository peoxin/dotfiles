return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    keys = {
        { "<Leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle file tree" },
        { "<Leader>o", "<cmd>Neotree focus<CR>",  desc = "Focus on file tree" },
    },
    opts = {
        window = { width = 35 },
    }
}
