return {
	"goolord/alpha-nvim",
	lazy = true,
	cond = function()
		return vim.fn.argc() == 0
	end,
	event = "VimEnter",

	dependencies = {
		{
			"echasnovski/mini.icons",
			version = false,
			config = function()
				require("mini.icons").setup()
			end,
		},
	},

	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")
		-- local icons = require("mini.icons")

		-- 🔧 Patch: Startify File-Icon-Resolver überschreiben
		dashboard.file_icon = function(path)
			local ext = vim.fn.fnamemodify(path, ":e")
			local icon, hl = icons.get("file", path)
			if not icon then
				icon, hl = icons.get("default")
			end
			return icon .. " ", hl
		end

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
