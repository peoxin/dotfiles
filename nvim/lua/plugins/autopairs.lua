local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

autopairs.setup({
	-- Enable treesitter
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false,
	},
})

local cmp_autopairs_status, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
if not cmp_autopairs_status then
	return
end

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

-- Make autopairs and completion work together
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
