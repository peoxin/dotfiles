return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		panel = { enabled = false },
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = "<Right>",
				accept_line = "<A-Right>",
				prev = "<Up>",
				next = "<Down>",
				dismiss = "<Left>",
			},
		},
		filetypes = {
			markdown = true,
			gitcommit = true,
		},
	},
}
