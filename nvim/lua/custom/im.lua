-- A simple script to switch input method automatically
-- Supports macOS and Linux (fcitx5)

-- Get the current operating system
local os = vim.loop.os_uname().sysname

-- Set the default input method and
-- the command to get and set the input method
local default_im, get_im_cmd, set_im_cmd
if os == "Darwin" then
    default_im = "com.apple.keylayout.ABC"
    get_im_cmd = "im-select"
    set_im_cmd = "im-select"
else
    default_im = "keyboard-us"
    get_im_cmd = "fcitx5-remote -n"
    set_im_cmd = "fcitx5-remote -s"
end

local function get_current_im()
    return vim.fn.system(get_im_cmd)
end

local function set_current_im(im)
    local cmd = table.concat({ set_im_cmd, im }, " ")
    vim.fn.jobstart(cmd, { detach = true })
end

local function switch_to_default_im()
    local current_im = get_current_im()
    vim.api.nvim_set_var("previous_im", current_im)
    set_current_im(default_im)
end

local function restore_previous_im()
    local previous = vim.g["previous_im"]
    set_current_im(previous)
end

-- Add autocmds to switch input method automatically
local group = vim.api.nvim_create_augroup("UserImSwitch", { clear = true })
vim.api.nvim_create_autocmd(
    { "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" }, {
        group = group,
        callback = switch_to_default_im,
    })
vim.api.nvim_create_autocmd("InsertEnter", {
    group = group,
    callback = restore_previous_im,
})
