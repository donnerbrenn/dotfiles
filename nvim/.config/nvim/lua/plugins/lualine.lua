-- lua/plugins/lualine.lua
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
				lualine_c = {
					{ "filename", icon = "", padding = { left = 1, right = 1 } },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = "󰅚 ", -- High-Res Close Circle (Material)
							warn = "󰀪 ", -- Alert Triangle (Material)
							info = "󰋽 ", -- Info Circle (Material)
							hint = "󰌶 ", -- Lightbulb (Material)
						},
						diagnostics_color = {
							error = { fg = "#ff5370" }, -- Material Red
							warn = { fg = "#ffcb6b" }, -- Material Yellow
							info = { fg = "#82aaff" }, -- Material Blue
							hint = { fg = "#c3e88d" }, -- Material Green
						},
						colored = true,
						update_in_insert = false,
						always_visible = true,
					},
				},
				lualine_y = { { "fileformat" }, { "encoding" } },
				lualine_x = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if next(clients) == nil then
								return "No LSP"
							end

							local names = {}
							for _, client in ipairs(clients) do
								table.insert(names, client.name)
							end
							return table.concat(names, ", ")
						end,
						icon = "󰒋", -- Modernes Server-Icon
						color = { fg = "#82aaff", gui = "bold" }, -- Material Blue
					},
					{ "filetype" },
				},
				lualine_z = { { "branch", icon = "" } },
			},
		})
	end,
}
