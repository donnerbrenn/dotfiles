return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
	},
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
				-- Wir fügen 'winblend = 0' hinzu, um sicherzugehen, dass Neovim nicht mitspricht
				winblend = 0,
				winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
			},
			documentation = {
				auto_show = true,
				window = {
					border = "rounded",
					winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
				},
			},
		},
		signature = {
			enabled = true,
			window = {
				border = "rounded",
				winhighlight = "Normal:BlinkCmpSignature,FloatBorder:BlinkCmpSignatureBorder",
			},
		},
	},

	config = function(_, opts)
		local set_hl = vim.api.nvim_set_hl

		-- Damit die Transparenz wirklich greift, setzen wir 'bg = "NONE"'
		-- Wir nutzen die Farben aus deiner Lualine für ein stimmiges Gesamtbild
		set_hl(0, "BlinkCmpMenu", { bg = "NONE" })
		set_hl(0, "BlinkCmpMenuBorder", { fg = "#45475a", bg = "NONE" })
		set_hl(0, "BlinkCmpMenuSelection", { bg = "#313244", fg = "NONE", bold = true })

		-- Hier nutzen wir das Blau aus deiner Lualine (#82aaff) für die Treffer
		set_hl(0, "BlinkCmpLabelMatch", { fg = "#82aaff", bold = true })

		set_hl(0, "BlinkCmpDoc", { bg = "NONE" })
		set_hl(0, "BlinkCmpDocBorder", { fg = "#45475a", bg = "NONE" })

		set_hl(0, "BlinkCmpSignature", { bg = "NONE" })
		set_hl(0, "BlinkCmpSignatureBorder", { fg = "#45475a", bg = "NONE" })

		require("blink.cmp").setup(opts)
	end,
}
