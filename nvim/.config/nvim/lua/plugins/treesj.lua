return {
	"Wansmer/treesj",
	-- 1. Trigger: Das Plugin wird erst geladen, wenn du einen dieser Keys drückst
	keys = {
		{
			"<leader>cj",
			function()
				require("treesj").toggle()
			end,
			desc = "Toggle Treesj (Split/Join)",
		},
	},
	-- 2. Optionaler Trigger: Falls du es über die Befehlszeile aufrufst
	cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },

	dependencies = { "nvim-treesitter/nvim-treesitter" },

	config = function()
		require("treesj").setup({
			use_default_keymaps = false, -- Deine Einstellungen bleiben erhalten
		})
	end,
}
