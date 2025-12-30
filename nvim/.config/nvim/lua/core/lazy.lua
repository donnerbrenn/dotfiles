-- lua/core/lazy.lua

-- Lazy.nvim Bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- Plugins & Einstellungen
require("lazy").setup({
	-- Hier liegen deine Plugins
	{ "tpope/vim-sleuth", event = "BufRead" },
	{ import = "plugins" },
}, {
	-- Hier liegen die globalen Optionen für das Machwerk
	ui = {
		-- Der abgerundete Rahmen für das Lazy-Fenster
		border = "rounded",
		-- Optional: Wenn du willst, dass Lazy mini.icons nutzt
		icons = {
			ft = "📂",
			lazy = "💤 ",
			loaded = "",
			not_loaded = "",
		},
	},
	change_detection = {
		enabled = false, -- Schaltet die Benachrichtigung bei Config-Änderungen aus
		notify = false,
	},
	performance = {
		rtp = {
			-- Das sorgt dafür, dass die Startzeit so niedrig bleibt
			disabled_plugins = {
				"gzip",
				"zipPlugin",
				"netrwPlugin",
				"tarPlugin",
			},
		},
	},
})
