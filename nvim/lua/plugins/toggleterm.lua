return {
    "akinsho/toggleterm.nvim",
    keys = {
        -- Press `Ctrl-D` to exit terminal
        {
            "<Leader>tf",
            mode = { "n", "t" },
            "<cmd>ToggleTerm direction=float<CR>",
            desc = "Toggle float terminal",
        },
        {
            "<Leader>t-",
            mode = { "n", "t" },
            "<cmd>ToggleTerm direction=horizontal<CR>",
            desc = "Toggle horizontal terminal",
        },
        {
            "<Leader>t\\",
            mode = { "n", "t" },
            "<cmd>ToggleTerm direction=vertical<CR>",
            desc = "Toggle vertical terminal",
        },
    },
    opts = {
        -- Don't change directory in terminal when
        -- neovim changes its current working directory
        autochdir = false,
    },
    config = function(_, opts)
        require("toggleterm").setup(opts)

        -- Add hint for key bindings in which-key
        local wk = require("which-key")
        wk.add({ { "<Leader>t", group = "Terminal" } })
    end,
}
