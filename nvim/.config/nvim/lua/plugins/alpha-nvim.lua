return {
	"goolord/alpha-nvim",
	-- WICHTIG: Explizit als lazy markieren, damit es nicht im 'start'-Block landet
	lazy = true,
	-- Es soll nur laden, wenn keine Argumente (Dateien) beim Start übergeben wurden
	cond = function()
		return vim.fn.argc() == 0
	end,
	-- Da cond wahr ist, wenn wir 'nvim' ohne Datei tippen, wird es sofort danach geladen
	event = "VimEnter",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		-- Webicons initialisieren
		require("nvim-web-devicons").setup({
			default = true,
		})

		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[_____  __                     _____]],
			[[___  | / /_____ ______ ___   _____(_)_______ ___]],
			[[__   |/ / _  _ \_  __ \__ | / /__  / __  __ `__ \]],
			[[_  /|  /  /  __// /_/ /__ |/ / _  /  _  / / / / /]],
			[[/_/ |_/   \___/ \____/ _____/  /_/   /_/ /_/ /_/]],
		}

		alpha.setup(dashboard.opts)
	end,
}
