return {
	"nosduco/remote-sshfs.nvim",
	event = "VeryLazy",
	dependencies = {
		{
			"nvim-telescope/telescope.nvim",
			config = function()
				require("telescope").load_extension("remote-sshfs")
			end,
		},
	},
	keys = {
	    -- stylua: ignore start
		{ "<Leader>rc", function() require("remote-sshfs.api").connect() end, desc = "Connect" },
		{ "<Leader>rd", function() require("remote-sshfs.api").disconnect() end, desc = "Disconnect" },
		-- stylua: ignore end
	},
	opts = {
		handlers = {
			on_disconnect = {
				clean_mount_folders = true,
			},
		},
		ui = {
			confirm = {
				connect = false,
			},
		},
	},
}
