return {
	{
		"mfussenegger/nvim-dap",
		dependencies = { "rcarriga/nvim-dap-ui" },
		keys = {
			{ "<Leader>dc", ":lua require('dap').continue()<CR>", desc = "Continue" },
			{ "<F5>", ":lua require('dap').continue()<CR>", desc = "Continue" },
			{ "<Leader>db", ":lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
			{ "<F9>", ":lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle breakpoint" },
			{ "<Leader>dC", ":lua require('dap').run_to_cursor()<CR>", desc = "Run to cursor" },
			{ "<Leader>dO", ":lua require('dap').step_over()<CR>", desc = "Step over" },
			{ "<F10>", ":lua require('dap').step_over()<CR>", desc = "Step over" },
			{ "<Leader>di", ":lua require('dap').step_into()<CR>", desc = "Step into" },
			{ "<F11>", ":lua require('dap').step_into()<CR>", desc = "Step into" },
			{ "<Leader>do", ":lua require('dap').step_out()<CR>", desc = "Step out" },
			{ "<F12>", ":lua require('dap').step_out()<CR>", desc = "Step out" },
		},
	},
	{
		"rcarriga/nvim-dap-ui",
		keys = {
			{ "<Leader>du", ":lua require('dapui').toggle({})<CR>", desc = "Toggle DAP UI" },
			{ "<Leader>de", ":lua require('dapui').eval()<CR>", mode = { "n", "v" }, desc = "Eval" },
		},
		opts = {},
		config = function(_, opts)
			local dap = require("dap")
			local dapui = require("dapui")
			dapui.setup(opts)
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
}
