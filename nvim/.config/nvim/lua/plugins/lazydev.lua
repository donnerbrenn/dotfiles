return {
	"folke/lazydev.nvim",
	ft = "lua", -- Lädt das Plugin nur, wenn eine Lua-Datei geöffnet wird
	opts = {
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	},
}
