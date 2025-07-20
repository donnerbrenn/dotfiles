-- ~/.config/nvim/lua/plugins/toggleterm.lua

return {
	"akinsho/toggleterm.nvim",
	version = "*",
	event = "VeryLazy",
	config = function()
		require("toggleterm").setup({
			-- Größe des horizontalen Terminals in Zeilen
			size = 12,

			-- STRG + \ öffnet das Terminal
			open_mapping = [[<C-\>]],

			-- Terminal immer unten anzeigen
			direction = "horizontal",

			-- Start im Insert-Modus (logisch bei Shells)
			start_in_insert = true,

			-- Eingaben und Tastenkürzel im Insert-/Terminalmodus
			insert_mappings = true,
			terminal_mappings = true,

			-- Einstellungen beibehalten (Größe, Modus)
			persist_size = true,
			persist_mode = true,

			-- Terminal schließen bei Exit
			close_on_exit = true,

			-- Nutze Shell aus Vim-Konfiguration
			shell = vim.o.shell,
		})

		-- Optional: spezielles Terminal z. B. für lazygit
		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
		})

		vim.keymap.set("n", "<leader>g", function()
			lazygit:toggle()
		end, { desc = "Toggle LazyGit Terminal" })

		-- Optional: direkter Shortcut für Standard-Terminal
		vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Toggle Terminal Below" })
	end,
}
