return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"theHamsta/nvim-dap-virtual-text", -- Hier einfügen
	},
	config = function()
		local dap = require("dap")
		-- Initialisiere die virtuellen Texte hier
		require("nvim-dap-virtual-text").setup({
			enabled = true,
			highlight_changed_variables = true,
			-- ... deine restlichen opts
		})
	end,
}
