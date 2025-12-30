local function enable_transparency()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	vim.api.nvim_set_hl(0, "IblScope", { fg = "#82aaff", nocombine = true })
	vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4252", nocombine = true })
end
return {
	{
		"mhartington/oceanic-next",
		event = "VeryLazy",
		version = "*",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("OceanicNext")
			enable_transparency()
		end,
	},
}
