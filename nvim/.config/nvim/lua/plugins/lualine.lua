return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "material",
				section_separators = { left = nil, right = nil },
				component_separators = { left = nil, right = nil },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "location", icon = "" } },
				lualine_c = { { "filename", icon = "" } },
				lualine_y = { { "fileformat" }, { "encoding" } },
				lualine_x = { { "filetype" } },
				lualine_z = { { "branch", icon = "" } },
			},
		})
	end,
}
