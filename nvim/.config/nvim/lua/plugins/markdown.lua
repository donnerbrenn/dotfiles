return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		event = "VeryLazy",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"echasnovski/mini.icons", -- Deine gewünschten Icons
		},
		opts = {
			-- Optional: Falls du sichergehen willst, dass er Conceal erzwingt
			render = {
				min_width = 100,
			},
		},
		ft = { "markdown" }, -- Lädt nur bei Markdown files
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
			end
		end,
	},
}
