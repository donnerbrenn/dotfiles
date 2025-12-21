return {
	"folke/which-key.nvim",
	event = "VimEnter",
	opts = {
		preset = "helix",
		width = 0.9,
		height = { min = 4, max = 50 }, --
		icons = {
			group = "+", -- Entfernt das "+" Zeichen
			separator = " ", -- Sorgt für einen cleanen Abstand
		},
		-- Sortiert Gruppen (mit Icons) nach oben
		sort = { "group", "local", "order", "alphanum" },
		win = {
			border = "rounded", -- Passt zu deinem Material-Look
			padding = { 1, 2 },
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		vim.api.nvim_set_hl(0, "WhichKey", { fg = "#c3e88d", bold = true, underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyGroup", { fg = "#82aaff", bold = true, underline = false })
		vim.api.nvim_set_hl(0, "WhichKeyDesc", { fg = "#eeffff", underline = false })
		-- vim.api.nvim_set_hl(0, "WhichKeyBorder", { fg = "#37474f" })

		wk.add({
			-- Gruppen (Wir nutzen 'group' statt 'desc', wo es Sinn ergibt)
			{ "<leader>c", group = "[C]ode", icon = "" },
			{ "<leader>s", group = "[S]earch", icon = "" },
			{ "<leader>p", group = "[P]ackages", icon = "" },
			{ "<leader>t", group = "[T]oggle", icon = "󰏔" },
			{ "<leader>w", group = "[W]indow", icon = "" },
			{ "<leader>b", group = "[B]uffer", icon = "" },
			{ "<leader>l", group = "[L]SP", icon = "" },
			{ "<leader>d", group = "[D]iagnostics", icon = "" },
			{ "<leader>j", group = "[J]ump", icon = "󱋿" },

			-- Einzelne Keys (Icons ohne nervige Klammern)
			{ "<leader>a", desc = "Select All", icon = "󰒆" },
			{ "<leader>o", desc = "Insert Below", icon = "" },
			{ "<leader>O", desc = "Insert Above", icon = "" },
			{ "<leader>y", desc = "Yank All", icon = "" },
			{ "<leader>R", desc = "Reload Config", icon = "󰑓" },
		})
	end,
}
