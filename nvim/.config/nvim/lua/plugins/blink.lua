return {
	"saghen/blink.cmp",
	event = "VeryLazy",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
	version = "*",
	event = { "BufReadPost", "BufNewFile" },

	opts = {
		-- Keymaps für flüssiges Arbeiten
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
			default = { "lsp", "snippets", "path", "buffer" },
		},

		completion = {
			-- Das Hauptmenü (Vorschlagsliste)
			menu = {
				border = "rounded",
				winblend = 0,
				max_height = 10, -- Nicht zu lang werden lassen
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},

			-- Das Info-Fenster (Dokumentation)
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				window = {
					border = "rounded",
					winblend = 0,
					-- GRÖSSEN-DECKEL: Verhindert, dass die Doku den Screen übernimmt
					max_width = 60,
					max_height = 20,
					-- POSITION-FIX: Verhindert das Überlappen
					direction_priority = {
						menu_north = { "e", "w" },
						menu_south = { "e", "w" },
					},
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
				},
			},

			list = {
				selection = { preselect = true, auto_insert = false },
			},
		},

		-- Hilfe für Funktionsparameter (Signaturen)
		signature = {
			enabled = false,
			window = {
				border = "rounded",
				winblend = 0,
				-- Kleine Verschiebung, damit Rahmen sich nicht berühren
				-- offset_y = -100,
				max_width = 60,
				winhighlight = "Normal:BlinkCmpSignature,FloatBorder:BlinkCmpSignatureBorder",
			},
		},

		snippets = {
			preset = "default",
		},
	},
	config = function(_, opts)
		local set_hl = vim.api.nvim_set_hl
		set_hl(0, "NormalFloat", { bg = "NONE", fg = "#ffffff" })
		set_hl(0, "Pmenu", { bg = "NONE", fg = "#ffffff" })
		set_hl(0, "BlinkCmpMenu", { bg = "NONE", fg = "#ffffff" })
		set_hl(0, "BlinkCmpMenuBorder", { fg = "#45475a", bg = "NONE" })
		set_hl(0, "BlinkCmpMenuSelection", { bg = "#82aaff", fg = "#45475a", bold = true })

		set_hl(0, "BlinkCmpLabelMatch", { fg = "#82aaff", bold = true })

		set_hl(0, "BlinkCmpDoc", { bg = "NONE", fg = "#ffffff" })
		set_hl(0, "BlinkCmpDocBorder", { fg = "#45475a", bg = "NONE" })

		set_hl(0, "BlinkCmpSignature", { bg = "NONE", fg = "#ffffff" })
		set_hl(0, "BlinkCmpSignatureBorder", { fg = "#45475a", bg = "NONE" })

		require("blink.cmp").setup(opts)
	end,
}
