-- lua/core/autocmds.lua

-- Highlight beim Yanken
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- lua/custom/active_window_highlight.lua

local M = {}

-- Farben definieren: leicht deckender Hintergrund fürs aktive Fenster
local active_bg = "#1a1a1a" -- dunkler, wirkt "weniger transparent"
local inactive_bg = "none" -- echte Terminal-Transparenz

-- Highlight-Gruppen setzen
function M.setup_highlights()
	vim.api.nvim_set_hl(0, "ActiveWindow", { bg = active_bg })
	vim.api.nvim_set_hl(0, "InactiveWindow", { bg = inactive_bg })
end

-- Autocommands für Fensterwechsel: Dynamisches Highlighting
function M.setup_autocmds()
	vim.api.nvim_create_autocmd("WinEnter", {
		callback = function()
			vim.wo.winhighlight = "Normal:ActiveWindow"
		end,
	})

	vim.api.nvim_create_autocmd("WinLeave", {
		callback = function()
			vim.wo.winhighlight = "Normal:InactiveWindow"
		end,
	})
end

function M.setup()
	M.setup_highlights()
	M.setup_autocmds()
end

return M
