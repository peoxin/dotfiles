return {
	"folke/snacks.nvim",
	lazy = false,
	priority = 1000,
	keys = {
        -- stylua: ignore start
		{ "<Leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
		-- Find picker
		{ "<Leader>ff", function() Snacks.picker.smart() end, desc = "Files" },
        { "<Leader>fF", function() Snacks.picker.files({ hidden = true }) end, desc = "Files (include hidden)" },
        { "<Leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
        { "<Leader>fd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
        { '<Leader>f"', function() Snacks.picker.registers() end, desc = "Registers" },
        { "<Leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
        { "<Leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
        { '<Leader>fa', function() Snacks.picker.autocmds() end, desc = "Autocmds" },
        { "<Leader>fc", function() Snacks.picker.command_history() end, desc = "Command history" },
        { "<Leader>fC", function() Snacks.picker.commands() end, desc = "Commands" },
        { "<Leader>fu", function() Snacks.picker.undo() end, desc = "Undo history" },
        { "<Leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
        { "<Leader>fH", function() Snacks.picker.highlights() end, desc = "Highlights" },
        { "<Leader>fh", function() Snacks.picker.help() end, desc = "Help" },
        { "<Leader>fM", function() Snacks.picker.man() end, desc = "Man pages" },
        { "<Leader>fi", function() Snacks.picker.icons() end, desc = "Icons" },
        -- Grep picker
        { "<Leader>sb", function() Snacks.picker.lines() end, desc = "Current buffer" },
        { "<Leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Opened buffers" },
		{ "<Leader>sg", function() Snacks.picker.grep() end, desc = "Grep" },
        { "<Leader>sw", function() Snacks.picker.grep_word() end, desc = "Words", mode = { "n", "x" } },
        -- Terminal
		{ "<Leader>tt", function() Snacks.terminal() end, desc = "Terminal" },
		{ "<Leader>tg", function() Snacks.terminal("gitui") end, desc = "GitUI" },
		{ "<Leader>tb", function() Snacks.terminal("btm") end, desc = "Bottom" },
        -- LSP
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Go to definition" },
        { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Go to declaration" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Go to type definition" },
        { "gI", function() Snacks.picker.lsp_implementations() end, desc = "Go to implementation" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "Go to references" },
        { "<Leader>fs", function() Snacks.picker.lsp_symbols() end, desc = "LSP symbols" },
        { "<Leader>fS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP workspace symbols" },
		-- Other
        { "gp", function() Snacks.image.hover() end, desc = "Preview image" },
        { "<Leader>bD", function() Snacks.bufdelete.other() end, desc = "Delete other buffers" },
        { "]r", function() Snacks.words.jump(vim.v.count1) end, desc = "Next reference", mode = { "n", "t" } },
        { "[r", function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev reference", mode = { "n", "t" } },
		-- stylua: ignore end
	},
	opts = {
		explorer = { enabled = true },
		picker = {
			sources = {
				explorer = {
					layout = { preset = "default", preview = true },
					auto_close = true,
				},
			},
		},
		terminal = { enabled = true },
		indent = { animate = { enabled = false } },
		bufdelete = { enabled = true },
		words = { enabled = true },
		image = {
			enabled = true,
			doc = { inline = false, float = false },
		},
	},
}
