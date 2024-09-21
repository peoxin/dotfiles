return {
    "lewis6991/gitsigns.nvim",
    event = "BufEnter",
    opts = {
        signs = {
            add = { text = "▎" },
            change = { text = "▎" },
            delete = { text = "_" },
            topdelete = { text = "‾" },
            changedelete = { text = "▎" },
            untracked = { text = "▎" },
        },

        -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame = false,
        current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

        on_attach = function(bufnr)
            local gs = require("gitsigns")
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
            end

            -- Add key bindings for gitsigns
            -- stylua: ignore start
            map("n", "<Leader>gp", gs.prev_hunk, "Prev hunk")
            map("n", "<Leader>gn", gs.next_hunk, "Next hunk")
            map("n", "<Leader>gd", gs.diffthis, "Diff this")
            map("n", "<Leader>gD", function() gs.diffthis("~") end, "Diff this HEAD")
            map("n", "<Leader>gb", gs.toggle_current_line_blame, "Toggle line blame")
            -- stylua: ignore end
        end,
    },
}
