return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = "nvim-mini/mini.icons",
	opts = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = false,
			update_in_insert = false,
			always_visible = false,
		}

		-- Set `path = 1` to show relative path of the file
		local filename = { "filename", path = 1 }

		-- Set `icons_enabled = false` to disable icons
		local branch = { "branch", icons_enabled = true, icon = "󰘬" }
		local filetype = { "filetype" }
		local fileformat = { "fileformat", icons_enabled = false }

		-- A whitespace as placeholder
		local whitespace = function()
			return " "
		end

		return {
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = { "Avante", "AvanteInput", "AvanteSelectedFiles", "snacks_terminal" },
				always_divide_middle = true,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { branch, diagnostics },
				lualine_c = { filename },
				lualine_x = { "encoding", fileformat, filetype },
				lualine_y = { "location" },
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { filename },
				lualine_x = { "encoding", fileformat, filetype },
				lualine_y = {},
				lualine_z = {},
			},
			winbar = { lualine_c = { "aerial" } },
			inactive_winbar = { lualine_c = { whitespace } },
			extensions = {
				"aerial",
				"lazy",
				"mason",
				"fzf",
			},
		}
	end,
}
