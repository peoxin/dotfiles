return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        -- Decrease mapped sequence wait time to display which-key popup sooner
        vim.o.timeout = true
        vim.opt.timeoutlen = 500
    end,
    config = function()
        -- Add hint for key bindings in which-key
        local wk = require("which-key")
        wk.add({
            { "<leader>a", group = "AI" },
            { "<leader>b", group = "Buffer" },
            { "<Leader>c", group = "Code" },
            { "<Leader>f", group = "Find" },
            { "<Leader>g", group = "Git" },
            { "<Leader>m", group = "Markdown" },
            { "<Leader>t", group = "Terminal" },
        })
    end
}
