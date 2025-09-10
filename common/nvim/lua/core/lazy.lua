-- Install `lazy.nvim` plugin manager if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Setup `lazy.nvim`
-- All plugins are configured in `plugins` directory
require("lazy").setup({
	spec = {
		{ import = "plugins" },
		{ import = "plugins.colorscheme" },
	},
})
