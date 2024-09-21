return {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    build = function() vim.fn["mkdp#util#install"]() end,
    keys = { { "<Leader>md", "<cmd>MarkdownPreviewToggle<CR>", desc = "Toggle markdown preview" } },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    config = function()
        -- Add hint for key bindings in which-key
        local wk = require("which-key")
        wk.add({ { "<Leader>m", group = "Markdown" } })
    end
}
