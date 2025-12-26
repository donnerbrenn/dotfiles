return {
	"tversteeg/registers.nvim",
	cmd = "Registers",
	keys = {
		{ '"', mode = { "n", "v" } },
		{ "<C-R>", mode = "i" },
		-- Dein gewünschter Toggle:
		{ "<leader>tr", "<cmd>Registers<cr>", desc = "Registers overview" },
	},
	opts = {
		-- Hier kannst du das Design anpassen (z.B. "border")
		window = {
			border = "rounded",
		},
	},
}
