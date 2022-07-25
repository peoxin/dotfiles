return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	keys = {
		{ "<Leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find files" },
		{ "<Leader>fF", "<cmd>Telescope find_files hidden=true<CR>", desc = "Find files (include hidden)" },
		{ "<Leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Find recent files" },
		{ "<Leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find string" },
		{ "<Leader>fG", "<cmd>Telescope live_grep hidden=true<CR>", desc = "Find string (include hidden)" },
		{ "<Leader>fs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Find document symbols" },
		{ "<Leader>fb", "<cmd>Telescope buffers<CR>", desc = "Find buffers" },
		{ "<Leader>fd", "<cmd>Telescope diagnostics<CR>", desc = "Find diagnostics" },
		{ "<Leader>fk", "<cmd>Telescope keymaps<CR>", desc = "Find keymaps" },
		{ "<Leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find help tags" },
	},
	opts = function()
		local actions = require("telescope.actions")
		return {
			defaults = {
				path_display = { "smart" },

				-- Configure layout
				layout_strategy = "horizontal",
				layout_config = {
					horizontal = {
						preview_width = 0.55,
						preview_cutoff = 60,
					},
				},

				mappings = {
					i = {
						-- Close telescope
						["<C-c>"] = actions.close,

						-- Navigate results
						["<Up>"] = actions.move_selection_previous,
						["<Down>"] = actions.move_selection_next,

						-- Open selected item in different ways
						["<CR>"] = actions.select_default,
						["<C-\\>"] = actions.select_vertical,
						["<C--"] = actions.select_horizontal,
						["<C-t>"] = actions.select_tab,

						-- Scroll in preview window
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						-- Open help
						["<C-?>"] = actions.which_key,
					},
					n = {
						-- Close telescope
						["<Esc>"] = actions.close,

						-- Navigate results
						["<Up>"] = actions.move_selection_previous,
						["<Down>"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["j"] = actions.move_selection_next,
						["gg"] = actions.move_to_top,
						["G"] = actions.move_to_bottom,

						-- Open selected item in different ways
						["<CR>"] = actions.select_default,
						["<C-\\"] = actions.select_vertical,
						["<C--"] = actions.select_horizontal,
						["<C-t>"] = actions.select_tab,

						-- Scroll in preview window
						["<C-u>"] = actions.preview_scrolling_up,
						["<C-d>"] = actions.preview_scrolling_down,

						-- Open help
						["<C-?>"] = actions.which_key,
					},
				},
			},
			pickers = {},
			extensions = {},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)

		-- Load fzf extension
		telescope.load_extension("fzf")
	end,
}
