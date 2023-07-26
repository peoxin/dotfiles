return {
	"lewis6991/gitsigns.nvim",
	event = "BufEnter",
	opts = {
		signs = {
			add = { text = "▎" },
			change = { text = "▎" },
			delete = { text = "" },
			topdelete = { text = "" },
			changedelete = { text = "▎" },
			untracked = { text = "▎" },
		},

		current_line_blame = false,
		current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",

		on_attach = function(buffer)
			local gs = package.loaded.gitsigns
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
			end

            -- stylua: ignore start
            map("n", "]h", gs.next_hunk, "Next hunk")
            map("n", "[h", gs.prev_hunk, "Prev hunk")
            map("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "Blame line")
            map("n", "<leader>ghB", gs.toggle_current_line_blame, "Toggle blame line")
            map("n", "<leader>ghd", gs.diffthis, "Diff this")
            map("n", "<leader>ghD", function() gs.diffthis("~") end, "Diff this ~")
		end,
	},
}
