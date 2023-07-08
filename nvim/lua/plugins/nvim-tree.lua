return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeOpen", "NvimTreeFocus", "NvimTreeToggle" },
	keys = { { "<Leader>e", ":NvimTreeToggle<CR>", desc = "Toggle file tree" } },
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = {
		sync_root_with_cwd = true,
		update_focused_file = {
			enable = true,
			update_cwd = true,
		},
		renderer = {
			root_folder_modifier = ":t",
			icons = {
				glyphs = {
					default = "",
					symlink = "",
					folder = {
						arrow_open = "",
						arrow_closed = "",
						default = "",
						open = "",
						empty = "",
						empty_open = "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged = "",
						staged = "S",
						unmerged = "",
						renamed = "➜",
						untracked = "U",
						deleted = "",
						ignored = "◌",
					},
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
			icons = {
				hint = "",
				info = "",
				warning = "",
				error = "",
			},
		},
		view = {
			width = 30,
			side = "left",
			mappings = {
				list = {
					{ key = { "l", "<CR>", "o" }, action = "edit" },
					{ key = "h", action = "close_node" },
					{ key = "H", action = "collapse_all" },
					{ key = "w", action = "cd" },
					{ key = "d", action = "" },
					{ key = "<C-h>", action = "split" },
				},
			},
		},
		actions = {
			change_dir = {
				enable = true,
				global = true,
				restrict_above_cwd = false,
			},
		},
	},
}
