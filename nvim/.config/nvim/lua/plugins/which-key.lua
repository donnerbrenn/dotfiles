return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "helix",
		spec = {},
		win = {
			border = "rounded",
			padding = { 1, 2 },
			wo = {
				winblend = 0,
			},
		},
		layout = {
			width = 0.9,
			height = { min = 4, max = 25 },
			spacing = 3,
		},
		icons = {
			group = "",
			separator = "➜",
		},
	},
	config = function(_, opts)
		local wk = require("which-key")
		wk.setup(opts)

		local set_hl = vim.api.nvim_set_hl
		set_hl(0, "WhichKeyGroup", { fg = "#82aaff", bold = true, underline = false })
		set_hl(0, "WhichKeyIcon", { fg = "#82aaff", underline = false })
		set_hl(0, "WhichKey", { fg = "#c3e88d", bold = true })
		set_hl(0, "WhichKeyGroup", { fg = "#82aaff", bold = true })
		set_hl(0, "WhichKeyDesc", { fg = "#eeffff" })
		set_hl(0, "WhichKeySeparator", { fg = "#546e7a" })
		set_hl(0, "WhichKeyBorder", { fg = "#82aaff" })
		set_hl(0, "WhichKeyNormal", { bg = "NONE" })

		wk.add({
			{ "<leader>b", group = "Buffer", icon = "" },
			{ "<leader>c", group = "Code", icon = "" },
			{ "<leader>d", group = "Diagnostics", icon = "" },
			{ "<leader>j", group = "Jump", icon = "󱋿" },
			{ "<leader>l", group = "LSP", icon = "" },
			{ "<leader>p", group = "Packages", icon = "" },
			{ "<leader>s", group = "Search", icon = "" },
			{ "<leader>t", group = "Toggle", icon = "󰔢" },
			{ "<leader>w", group = "Window", icon = "" },
			-- Einzelne Keys
			{ "<leader>a", desc = "Select All", icon = "󰒆" },
			{ "<leader>y", desc = "Yank All", icon = "" },
			{ "<leader>R", desc = "Reload Config", icon = "󰑓" },
			{ "<leader>O", "O<ESC>", desc = "Insert Line Above", icon = "" },
			{ "<leader>o", "o<ESC>", desc = "Insert Line Below", icon = "" },

			{
				"<leader><leader>",
				function()
					require("telescope.builtin").current_buffer_fuzzy_find()
				end,
				desc = "Find in current buffer",
				icon = "",
			},
		})
	end,
}
