local function custom_colors()
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "LineNr", { bg = "none" })
	vim.api.nvim_set_hl(0, "SignColumn", { bg = "none" })
	vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none" })
	vim.api.nvim_set_hl(0, "IblScope", { fg = "#82aaff", nocombine = true })
	vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3b4252", nocombine = true })
	vim.api.nvim_set_hl(0, "MyBlueYank", { bg = "#82aaff", fg = "#000000", bold = true })

	local yank_group = vim.api.nvim_create_augroup("YankHighlightGroup", { clear = true })
	vim.api.nvim_create_autocmd("TextYankPost", {
		group = yank_group,
		callback = function()
			vim.highlight.on_yank({
				higroup = "MyBlueYank",
				timeout = 200,
			})
		end,
	})
end
return {
	{
		"mhartington/oceanic-next",
		event = "VeryLazy",
		version = "*",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("OceanicNext")
			custom_colors()
		end,
	},
}
