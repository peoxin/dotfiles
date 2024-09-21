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

        on_attach = function(buffer)
            local gs = require("gitsigns")
            local function map(mode, l, r, desc)
                vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
            end

            -- Add key bindings for gitsigns
            -- stylua: ignore start
            map("n", "[h", gs.prev_hunk, "Prev hunk")
            map("n", "]h", gs.next_hunk, "Next hunk")
            map("n", "<Leader>gtd", gs.diffthis, "Diff this")
            map("n", "<Leader>gtD", function() gs.diffthis("~") end, "Diff this HEAD")
            map("n", "<Leader>gtb", gs.toggle_current_line_blame, "Toggle line blame")
            -- stylua: ignore end

            -- Add hint for key bindings in which-key
            local wk = require("which-key")
            wk.add({ { "<Leader>gt", group = "Git" } })
        end,
    },
}
