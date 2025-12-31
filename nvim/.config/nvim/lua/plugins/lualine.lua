return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	config = function()
		require("lualine").setup({
			options = {
				theme = "material",
				globalstatus = true,
				section_separators = { left = nil, right = nil },
				component_separators = { left = nil, right = nil },
				disabled_filetypes = {
					statusline = {},
					winbar = { "alpha", "dashboard" },
				},
			},
			sections = {
				lualine_a = { { "mode", icon = "" } },
				lualine_b = { { "location", icon = "" } },
				lualine_c = {
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
							info = { fg = "#82aaff" }, -- Dein Signature-Blau
							hint = { fg = "#c3e88d" }, -- Dein Key-Grün
						},
						colored = true,
						update_in_insert = false,
						always_visible = true,
					},
					{ "filename", icon = "", padding = { left = 1, right = 1 } },
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
