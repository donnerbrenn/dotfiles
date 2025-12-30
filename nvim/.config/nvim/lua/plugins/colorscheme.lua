return {
	{
		"mhartington/oceanic-next",
		lazy = true,
		version = "*",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("OceanicNext")
		end,
	},
}
