if vim.g.vscode then
	require("vscode-config.options")
	require("vscode-config.keymaps")
	require("vscode-config.lazy")
else
	require("core.options")
	require("core.keymaps")
	require("core.lazy")
	require("custom.cmds")
end
