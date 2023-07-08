return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{ "<Leader>ff", ":Telescope find_files<CR>", desc = "Find files" },
		{
			"<Leader>fa",
			":Telescope find_files follow=true no_ignore=true hidden=true<CR>",
			desc = "Find files (include hidden files)",
		},
		{ "<Leader>fg", ":Telescope live_grep<CR>", desc = "Find string" },
		{ "<Leader>fb", ":Telescope buffers<CR>", desc = "Find buffers" },
		{ "<Leader>fh", ":Telescope help_tags<CR>", desc = "Find help tags" },
	},
	opts = function()
		local actions = require("telescope.actions")
		return {
			defaults = {
				prompt_prefix = " ",
				selection_caret = " ",
				path_display = { "smart" },

				layout_strategy = "horizontal",
				layout_config = {
					preview_width = 0.55,
					preview_cutoff = 60,
				},

				mappings = {
					i = {
						["<C-c>"] = actions.close,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,

						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["<C-?>"] = actions.which_key,
					},
					n = {
						["<Esc>"] = actions.close,

						["<Down>"] = actions.move_selection_next,
						["<Up>"] = actions.move_selection_previous,
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						["<CR>"] = actions.select_default,
						["<C-h>"] = actions.select_horizontal,
						["<C-v>"] = actions.select_vertical,
						["<C-t>"] = actions.select_tab,

						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						["<PageUp>"] = actions.results_scrolling_up,
						["<PageDown>"] = actions.results_scrolling_down,

						["<C-?>"] = actions.which_key,
					},
				},
			},
			pickers = {},
			extensions = {},
		}
	end,
}
