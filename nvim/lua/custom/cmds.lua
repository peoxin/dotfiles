-- Highlight what was yanked for a short period of time
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight what was yanked",
	group = vim.api.nvim_create_augroup("UserHighlightYanked", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- TypstCompile: Compile the current file with Typst
vim.api.nvim_create_user_command("TypstCompile", function()
	local filepath = vim.fn.expand("%")
	local result = vim.system({ "typst", "compile", filepath }, { text = true }):wait()

	if string.len(result.stderr) > 0 then
		vim.api.nvim_err_writeln("Typst Compile Error:\n" .. result.stderr)
	end
end, {})
