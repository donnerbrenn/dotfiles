-- Hilfsfunktion zum Setzen von Highlights
local set_hl = vim.api.nvim_set_hl

set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
set_hl(0, "BlinkCmpMenuBorder", { fg = "#45475a" })
set_hl(0, "BlinkCmpMenuSelection", { bg = "#313244", fg = "NONE", bold = true })
set_hl(0, "BlinkCmpLabelMatch", { fg = "#89b4fa", bold = true })
set_hl(0, "BlinkCmpDoc", { bg = "NONE" })
set_hl(0, "BlinkCmpDocBorder", { fg = "#45475a" })
set_hl(0, "BlinkCmpSignature", { bg = "NONE" })
set_hl(0, "BlinkCmpSignatureBorder", { fg = "#45475a" })

return {
	"saghen/blink.cmp",
	version = "*",
	event = { "BufReadPost", "BufNewFile" },
	opts = {
		keymap = {
			preset = "enter",
			["<Tab>"] = { "snippet_forward", "select_next", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		completion = {
			menu = {
				border = "rounded",
				-- Hier nutzen wir jetzt deine definierten Highlights
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},
			-- DAS WAR DER FEHLER: documentation muss INNERHALB von completion stehen
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
				},
			},
		},
		signature = {
			enabled = true, -- Empfehlenswert, falls du Signature Help willst
			window = {
				border = "rounded",
				winhighlight = "Normal:BlinkCmpSignature,FloatBorder:BlinkCmpSignatureBorder",
			},
		},
	},
}
