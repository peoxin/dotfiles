-- Switch input method automatically (fcitx5)

-- Default input method
local default_im = "keyboard-us"

local function get_current_im()
    return vim.fn.system("fcitx5-remote -n")
end

local function set_current_im(im)
    local cmd = table.concat({ "fcitx5-remote -s", im }, " ")
    return vim.fn.jobstart(cmd, { detach = true })
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
