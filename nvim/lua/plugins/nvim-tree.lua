return {
	"nvim-tree/nvim-tree.lua",
	cmd = { "NvimTreeOpen", "NvimTreeFocus", "NvimTreeToggle" },
	keys = { { "<Leader>e", ":NvimTreeToggle<CR>", desc = "Toggle file tree" } },
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	opts = function()
		local function on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, {
					buffer = bufnr,
					desc = "nvim-tree: " .. desc,
					noremap = true,
					silent = true,
					nowait = true,
				})
			end
			api.config.mappings.default_on_attach(bufnr)

			map("n", "l", api.node.open.edit, "Open")
			map("n", "o", api.node.open.edit, "Open")
			map("n", "<CR>", api.node.open.edit, "Open")
			map("n", "<C-h>", api.node.open.horizontal, "Open (horizontal split)")
			map("n", "h", api.node.navigate.parent_close, "Close directory")
			map("n", "H", api.tree.collapse_all, "Collapse all")
			map("n", "w", api.tree.change_root_to_node, "CD")
			map("n", "d", api.fs.cut, "Cut")
			map("n", "D", api.fs.remove, "Remove")
			map("n", "?", api.tree.toggle_help, "Toggle help")
		end

		return {
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
			},
			actions = {
				change_dir = {
					enable = true,
					global = true,
					restrict_above_cwd = false,
				},
			},
			on_attach = on_attach,
		}
	end,
}
