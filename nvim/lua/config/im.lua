-- Switch Input Method automatically (fcitx5)

local default_im = "keyboard-us"

local function get_current_im()
	local cmd = "fcitx5-remote -n"
	return vim.fn.system(cmd)
end

local function set_current_im(im)
	local cmd = "fcitx5-remote -s"
	return vim.fn.jobstart(table.concat({ cmd, im }, " "), { detach = true })
end

local function switch_to_default_im()
	local current = get_current_im()
	vim.api.nvim_set_var("previous_im", current)
	set_current_im(default_im)
end

local function restore_previous_im()
	local previous = vim.g["previous_im"]
	set_current_im(previous)
end

local set_default_events = { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" }
local set_previous_events = { "InsertEnter" }

local group = vim.api.nvim_create_augroup("im-switch", { clear = true })
vim.api.nvim_create_autocmd(set_default_events, {
	group = group,
	callback = switch_to_default_im,
})
vim.api.nvim_create_autocmd(set_previous_events, {
	group = group,
	callback = restore_previous_im,
})
