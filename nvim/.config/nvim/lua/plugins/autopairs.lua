return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = function()
		require("nvim-autopairs").setup({
			disable_filetype = { "TelescopePrompt", "spectre_panel" },
			ignored_next_char = "[%w%.]",
			enable_check_bracket_line = false,
			check_ts = true,
		})
	end,
}
