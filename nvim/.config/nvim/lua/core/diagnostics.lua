-- ~/.config/nvim/lua/config/diagnostics.lua

-- 1. Icons für die Seitenleiste (Sign Column) definieren
-- Falls du Nerd Fonts nutzt, sehen diese Icons super aus.
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- 2. Die eigentliche Diagnose-Konfiguration
vim.diagnostic.config({
	virtual_text = {
		source = "if_many", -- Zeigt Quelle nur an, wenn es mehrere LSPs gibt
		prefix = "●", -- Kleiner Punkt statt '■'
		-- Alternativ: prefix = '◄',
	},
	float = {
		source = "always",
		border = "rounded",
		header = "",
		prefix = "",
	},
	signs = true, -- Aktiviert die Icons von oben
	underline = true, -- Unterstreicht Fehler im Code
	update_in_insert = false, -- Weniger flackern beim Tippen
	severity_sort = true, -- Wichtigste Fehler zuerst
})
