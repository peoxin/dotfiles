-- Keymaps for VSCode Neovim
-- Every special (control/alt/non-alphanumerical) keyboard shortcut must be explicitly defined in VSCode to send to neovim
-- See: https://marketplace.visualstudio.com/items?itemName=asvetliakov.vscode-neovim#keybinding-passthroughs
local vscode = require("vscode")

-- Shortcut for the keymap function
local function map(mode, l, r, desc)
	vim.keymap.set(mode, l, r, { desc = desc, noremap = true, silent = true })
end

-- Normal Mode --
-- Window management --
-- stylua: ignore start
map("n", "<C-\\>", function() vscode.action("workbench.action.splitEditorRight") end, "Split window right")
map("n", "<C-->", function() vscode.action("workbench.action.splitEditorDown") end, "Split window down")
map("n", "<C-h>", function() vscode.action("workbench.action.focusLeftGroup") end, "Focus on left window")
map("n", "<C-j>", function() vscode.action("workbench.action.focusBelowGroup") end, "Focus on down window")
map("n", "<C-k>", function() vscode.action("workbench.action.focusAboveGroup") end, "Focus on up window")
map("n", "<C-l>", function() vscode.action("workbench.action.focusRightGroup") end, "Focus on right window")
map("n", "<C-Up>", function() vscode.action("workbench.action.increaseViewHeight") end, "Increase window height")
map("n", "<C-Down>", function() vscode.action("workbench.action.decreaseViewHeight") end, "Decrease window height")
map("n", "<C-Left>", function() vscode.action("workbench.action.decreaseViewWidth") end, "Decrease window width")
map("n", "<C-Right>", function() vscode.action("workbench.action.increaseViewWidth") end, "Increase window width")
map("n", "<C-w>h", function() vscode.action("workbench.action.moveEditorToLeftGroup") end, "Move window to left")
map("n", "<C-w>j", function() vscode.action("workbench.action.moveEditorToBelowGroup") end, "Move window to down")
map("n", "<C-w>k", function() vscode.action("workbench.action.moveEditorToAboveGroup") end, "Move window to up")
map("n", "<C-w>l", function() vscode.action("workbench.action.moveEditorToRightGroup") end, "Move window to right")
map("n", "<C-q>", function() vscode.action("workbench.action.closeEditorsInGroup") end, "Close window")
-- Buffer management --
map("n", "<S-h>", function() vscode.action("workbench.action.previousEditor") end, "Go to previous buffer")
map("n", "<S-l>", function() vscode.action("workbench.action.nextEditor") end, "Go to next buffer")
map("n", "<S-q>", function() vscode.action("workbench.action.closeActiveEditor") end, "Close buffer")
-- stylua: ignore end
-- Editing --
map("n", "<S-j>", "5j", "Faster down")
map("n", "<S-k>", "5k", "Faster up")
map("n", "<A-j>", "<cmd>move .+1<CR>==", "Move line down")
map("n", "<A-k>", "<cmd>move .-2<CR>==", "Move line up")
map("n", ";", "<S-j>", "Join two lines")
map("n", "<Esc>", "<cmd>nohlsearch<CR>", "Clear highlights")
map("n", "<Leader>cw", function()
	vscode.action("workbench.action.files.saveWithoutFormatting")
end, "Save file (without formatting)")

-- Visual Mode --
map("v", "<S-j>", "5j", "Faster down")
map("v", "<S-k>", "5k", "Faster up")
map("v", "<A-j>", "<cmd>move '>+1<CR>gv=gv", "Move lines down")
map("v", "<A-k>", "<cmd>move '<-2<CR>gv=gv", "Move lines up")
map("v", "<", "<gv", "Decrease indent")
map("v", ">", ">gv", "Increase indent")
map("v", ";", "<S-j>", "Join lines")
map("v", "p", '"_dP', "Paste")

-- Plugin Keymaps --
-- stylua: ignore start
map("n", "<Leader>e", function() vscode.action("workbench.view.explorer") end, "File Explorer")
map("n", "<Leader>ff", function() vscode.action("workbench.action.quickOpen") end, "Files")
map("n", "<Leader>tt", function() vscode.action("workbench.action.terminal.toggleTerminal") end, "Terminal")
-- LSP --
map("n", "gd", function() vscode.action("editor.action.revealDefinition") end, "Go to definition")
map("n", "gD", function() vscode.action("editor.action.goToDeclaration") end, "Go to declaration")
map("n", "gy", function() vscode.action("editor.action.goToTypeDefinition") end, "Go to type definition")
map("n", "gI", function() vscode.action("editor.action.goToImplementation") end, "Go to implementation")
map("n", "gr", function() vscode.action("editor.action.revealReferences") end, "Go to references")
map("n", "gk", function() vscode.action("editor.action.showHover") end, "Hover")
map("n", "<Leader>cr", function() vscode.action("editor.action.rename") end, "Rename symbol")
map("n", "<Leader>sR", function() vscode.action("workbench.action.replaceInFiles") end, "Replace in files")
-- stylua: ignore end
