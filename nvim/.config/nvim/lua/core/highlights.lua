-- lua/core/highlights.lua

local function apply_custom_highlights()
	-- 1. Transparenz-Einstellungen (für den sauberen Look)
	local highlights = {
		"Normal",
		"NormalNC",
		"LineNr",
		"Folded",
		"NonText",
		"SpecialKey",
		"VertSplit",
		"SignColumn",
		"EndOfBuffer",
	}
	for _, name in pairs(highlights) do
		vim.cmd.highlight(name .. " guibg=none ctermbg=none")
	end

	-- 2. Debugger Highlights definieren (Hell & Klar)
	local dap_colors = {
		DapBreakpoint = { fg = "#FF0000", bg = "NONE", bold = true }, -- Knallrot für Breakpoints
		DapStopped = { fg = "#00FF00", bg = "NONE", bold = true }, -- Giftgrün für die aktuelle Zeile
		DapLogPoint = { fg = "#00FFFF", bg = "NONE", bold = true }, -- Cyan für Log-Punkte
	}

	for group, settings in pairs(dap_colors) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- 3. Symbole (Signs) mit den Farben verknüpfen
	-- Breakpoint "B"
	vim.fn.sign_define("DapBreakpoint", {
		text = "B",
		texthl = "DapBreakpoint",
		linehl = "",
		numhl = "",
	})

	-- Aktuelle Zeile Pfeil "→"
	vim.fn.sign_define("DapStopped", {
		text = "→",
		texthl = "DapStopped",
		linehl = "CursorLine", -- Hebt die ganze Zeile dezent hervor
		numhl = "DapStopped",
	})
end

-- Funktion sofort beim Start ausführen
apply_custom_highlights()

-- Autocommand: Verhindert, dass ein Theme-Wechsel deine Einstellungen überschreibt
vim.api.nvim_create_autocmd("ColorScheme", {
	callback = apply_custom_highlights,
})
