-- lua/plugins/lualine.lua
return {
	"nvim-lualine/lualine.nvim",
	-- TRIGGER: Lade die Statuszeile erst, wenn die UI initialisiert wurde.
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "material",
				section_separators = { left = nil, right = nil },
				component_separators = { left = nil, right = nil },
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "location", icon = "" } },
				lualine_c = {
					{ "filename", icon = "", padding = { left = 1, right = 1 } },
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = "󰌵",
						},
						diagnostics_color = {
							error = { fg = "#dd5370" },
							warn = { fg = "#ffcb6b" },
							info = { fg = "#82aaff" },
							hint = { fg = "#c3e88d" },
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
						icon = "",
						color = { fg = "#82aaff", gui = "bold" },
					},
					{ "filetype" },
				},
				lualine_z = { { "branch", icon = "" } },
			},
		})
	end,
}
