return {
    "akinsho/bufferline.nvim",
    event = "BufEnter",
    dependencies = "nvim-tree/nvim-web-devicons",
    keys = {
        { "<leader>bp", "<cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
        { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned" },
    },
    opts = function()
        return {
            options = {
                always_show_bufferline = false,
                diagnostics = "nvim_lsp",
                hover = {
                    enabled = true,
                    delay = 100,
                    reveal = { "close" },
                },
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Tree",
                        highlight = "Directory",
                        text_align = "center",
                    },
                },
            },
            -- Use highlights from catppuccin theme
            highlights = require("catppuccin.groups.integrations.bufferline").get(),
        }
    end,
}
