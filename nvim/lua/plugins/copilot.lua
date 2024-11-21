return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	opts = {
		panel = { enabled = false },
		suggestion = {
			enabled = true,
			auto_trigger = true,
			keymap = {
				accept = "<A-;>",
				accept_line = "<A-=>",
				prev = "<A-[>",
				next = "<A-]>",
			},
		},
		filetypes = {
			markdown = true,
			gitcommit = true,
		},
	},
}
