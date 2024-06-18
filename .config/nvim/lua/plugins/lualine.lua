return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				theme = "material",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "filename", icon = "" } },
				lualine_c = { { "branch", icon = "" } },
				lualine_x = { { "encoding", "system", icon = "󰅨" } },
				lualine_y = { { "filetype" } },
				lualine_z = { { "location", icon = "" } },
			},
		})
	end,
}
