-- lua/core/autocmds.lua

-- Highlight beim Yanken
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
vim.api.nvim_create_autocmd({ "VimResized" }, {
	desc = "Fenster automatisch neu verteilen bei Größenänderung",
	callback = function()
		vim.cmd("tabdo wincmd =")
	end,
})
vim.api.nvim_create_autocmd("FileType", {
	desc = "Schließe bestimmte Fenster mit 'q'",
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	desc = "Fehlende Verzeichnisse automatisch erstellen beim Speichern",
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})
