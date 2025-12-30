-- lua/core/highlights.lua

local function apply_custom_highlights()
	local highlights = {
		"Normal",
		"NormalNC",
		"LineNr",
		"Folded",
		"NonText",
		"SpecialKey",
		"VertSplit",
		"SignColumn",
		"EndOfBuffer",
	}
	for _, name in pairs(highlights) do
		vim.cmd.highlight(name .. " guibg=none ctermbg=none")
	end

	local dap_colors = {
		DapBreakpoint = { fg = "#FF0000", bg = "NONE", bold = true },
		DapStopped = { fg = "#00FF00", bg = "NONE", bold = true },
		DapLogPoint = { fg = "#00FFFF", bg = "NONE", bold = true },
	}

	for group, settings in pairs(dap_colors) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	vim.fn.sign_define("DapBreakpoint", {
		text = "B",
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	})

	vim.fn.sign_define("DapStopped", {
		text = "→",
		texthl = "DapStopped",
		linehl = "CursorLine",
		numhl = "DapStopped",
	})
end

apply_custom_highlights()

vim.api.nvim_create_autocmd("ColorScheme", {
	callback = apply_custom_highlights,
})
