-- Highlight what was yanked for a short period of time
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight what was yanked",
	group = vim.api.nvim_create_augroup("UserHighlightYanked", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
