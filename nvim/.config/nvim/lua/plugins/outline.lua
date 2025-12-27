return {
	{
		"hedyhli/outline.nvim",
		lazy = true,
		config = function()
			require("outline").setup({
				outline_window = {
					width = 25,
				},
				symbol_folding = {
					autofold_depth = 1,
				},
				-- Hier erzwingen wir die Unterstützung für GLSL
				providers = {
					priority = { "lsp", "coc", "markdown", "norg" },
				},
				-- Falls dein LSP (glsl_analyzer) keine Symbole sendet,
				-- versuchen wir hier die Typen zu mappen:
				symbols = {
					filter = {
						-- Falls du merkst, dass GLSL nichts anzeigt,
						-- kommentiere diesen Filter testweise aus (nil setzen)
						exclude = { "Variable" },
					},
				},
			})
		end,
	},
}
