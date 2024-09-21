local function create_terminal(cmd, count)
    local Terminal = require("toggleterm.terminal").Terminal
    local term = Terminal:new({
        cmd = cmd,
        direction = "float",
        float_opts = { border = "single" },
        count = count,
        hidden = true,
    })
    return term
end

local function map(mode, l, r, desc)
    vim.api.nvim_set_keymap(mode, l, r, { desc = desc, noremap = true, silent = true })
end

-- Create a terminal for gitui
local gitui = create_terminal("gitui", 9)
function _gitui_toggle()
    gitui:toggle()
end

map("n", "<Leader>gu", "<cmd>lua _gitui_toggle()<CR>", "GitUI")

-- Create a terminal for bottom
local bottom = create_terminal("btm", 0)
function _bottom_toggle()
    bottom:toggle()
end

map("n", "<Leader>gb", "<cmd>lua _bottom_toggle()<CR>", "Bottom")
