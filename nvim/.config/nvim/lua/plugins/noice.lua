-- lazy.nvim
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		views = {
			-- Für die kleinen Meldungen (meistens unten rechts)
			mini = {
				timeout = 5000, -- Erhöht auf 5 Sekunden
			},
			-- Für die großen Popups (falls nvim-notify nicht genutzt wird)
			notify = {
				timeout = 5000,
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		-- "rcarriga/nvim-notify",
	},
}
