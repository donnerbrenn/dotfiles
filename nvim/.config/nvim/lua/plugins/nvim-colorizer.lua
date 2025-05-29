return {
	"NvChad/nvim-colorizer.lua",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		filetypes = { "*" }, -- oder z.B. { "css", "html", "lua" }
		user_default_options = {
			RGB = true, -- #RGB hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			names = false, -- "Name" codes like Blue
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = false, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba()
			hsl_fn = true, -- CSS hsl() and hsla()
			css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			mode = "background", -- "foreground" | "background" | "virtualtext"
			virtualtext = "■",
		},
		buftypes = {},
	},
	config = function(_, opts)
		require("colorizer").setup(opts)
	end,
}
