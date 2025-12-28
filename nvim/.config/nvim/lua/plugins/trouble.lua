return {
	"folke/trouble.nvim",
	-- Lädt das Plugin, sobald eine Datei gelesen oder neu angelegt wird
	event = { "BufReadPost", "BufNewFile" },
	opts = {},
	cmd = "Trouble",
	keys = {
		{
			"<leader>tx",
			"<cmd>Trouble diagnostics toggle<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}
