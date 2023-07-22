return {
	"nvim-lualine/lualine.nvim",
	opts = function()
		local diagnostics = {
			"diagnostics",
			sources = { "nvim_diagnostic" },
			sections = { "error", "warn" },
			symbols = { error = " ", warn = " " },
			colored = false,
			update_in_insert = false,
			always_visible = true,
		}
		local branch = {
			"branch",
			icons_enabled = true,
			icon = "",
		}
		local filename = {
			"filename",
			path = 1,
		}
		local filetype = {
			"filetype",
			-- icons_enabled = false,
		}
		local fileformat = {
			"fileformat",
			icons_enabled = false,
		}

		return {
			options = {
				icons_enabled = true,
				-- theme = "tokyonight",
				theme = "catppuccin",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {},
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
			winbar = {
				lualine_c = { "navic" },
			},
			extensions = {
				"lazy",
				"nvim-tree",
				"toggleterm",
				"nvim-dap-ui",
			},
		}
	end,
}
