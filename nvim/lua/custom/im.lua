-- A simple script to switch input method automatically
-- Supports MacOS (need to install https://github.com/daipeihust/im-select)
-- and Linux (fcitx5)

-- Set the default input method and system commands
local default_im, get_im_cmd, set_im_cmd
local os = vim.loop.os_uname().sysname
if os == "Darwin" then
	default_im = "com.apple.keylayout.ABC"
	get_im_cmd = { "im-select" }
	set_im_cmd = { "im-select" }
else
	default_im = "keyboard-us"
	get_im_cmd = { "fcitx5-remote", "-n" }
	set_im_cmd = { "fcitx5-remote", "-s" }
end

local function get_current_im()
	return vim.trim(vim.system(get_im_cmd):wait().stdout)
end

local function set_current_im(im)
	vim.system(vim.fn.extendnew(set_im_cmd, { im }))
end

-- Add autocmds to switch input method automatically
local group = vim.api.nvim_create_augroup("UserImSwitch", { clear = true })
vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave", "VimEnter", "FocusGained" }, {
	group = group,
	callback = function()
		local current_im = get_current_im()
		vim.api.nvim_set_var("previous_im", current_im)
		set_current_im(default_im)
	end,
})
vim.api.nvim_create_autocmd("InsertEnter", {
	group = group,
	callback = function()
		local previous = vim.api.nvim_get_var("previous_im")
		set_current_im(previous)
	end,
})
