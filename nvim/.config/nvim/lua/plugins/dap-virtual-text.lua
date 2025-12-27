return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text", -- Hier einfügen
	},
	config = function()
		-- Initialisiere die virtuellen Texte hier
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			highlight_changed_variables = true,
		})
	end,
}
