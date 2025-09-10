return {
	"lewis6991/gitsigns.nvim",
	event = "VeryLazy",
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},
		signs_staged = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},

		current_line_blame = false,
		current_line_blame_formatter = "<author>, <author_time:%R> - <summary>",

		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
			end

            -- Add key bindings for gitsigns
            -- stylua: ignore start
            map("n", "[h", function() gitsigns.nav_hunk("prev") end, "Previous hunk")
            map("n", "]h", function() gitsigns.nav_hunk("next") end, "Next hunk")
            map("n", "<Leader>gh", gitsigns.preview_hunk, "Preview hunk")
            map("n", "<Leader>gH", gitsigns.preview_hunk_inline, "Preview hunk (inline)")
            map("n", "<Leader>gs", gitsigns.stage_hunk, "Stage hunk")
            map("n", "<Leader>gu", gitsigns.undo_stage_hunk, "Undo stage hunk")
            map("n", "<Leader>gR", gitsigns.reset_hunk, "Reset hunk")
            map("n", "<Leader>gd", gitsigns.diffthis, "Diff file")
            map("n", "<Leader>gb", gitsigns.toggle_current_line_blame, "Toggle line blame")
			-- stylua: ignore end
		end,
	},
}
