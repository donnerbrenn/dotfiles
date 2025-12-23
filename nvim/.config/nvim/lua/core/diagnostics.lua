-- ~/.config/nvim/lua/config/diagnostics.lua

-- 1. Icons für die Diagnose-Level (wie gehabt)
local signs = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = " ",
	[vim.diagnostic.severity.INFO] = " ",
}

-- 2. Die Diagnose-Konfiguration
vim.diagnostic.config({
	signs = {
		text = signs,
	},
	virtual_text = {
		source = "if_many",
		prefix = "●",
	},
	float = {
		source = true,
		border = "rounded",
		header = "",
		prefix = "",
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})
