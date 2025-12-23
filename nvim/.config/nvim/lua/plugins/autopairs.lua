return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			-- Stoppt Pairing, wenn ein Buchstabe folgt
			ignored_next_char = "[%w%.]",
		})
	end,
}
