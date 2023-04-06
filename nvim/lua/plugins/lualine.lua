local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = { error = " ", warn = " " },
	colored = false,
	update_in_insert = false,
	always_visible = true,
}

local filetype = {
	"filetype",
	icons_enabled = false,
	icon = nil,
}

local fileformat = {
	"fileformat",
	fmt = string.lower,
	icons_enabled = false,
	icon = nil,
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

-- local spaces = function()
-- 	return vim.api.nvim_buf_get_option(0, "shiftwidth")
-- end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "tokyonight",
		section_separators = { left = "", right = "" },
		component_separators = { left = "", right = "" },
		disabled_filetypes = { "NvimTree" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { branch, diagnostics },
		lualine_c = { "filename" },
		lualine_x = { "encoding", fileformat, filetype },
		lualine_y = { "location" },
		lualine_z = { "progress" },
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "encoding", fileformat, filetype },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
