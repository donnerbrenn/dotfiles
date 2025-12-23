return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		priority = 1000, -- Lädt das Theme sofort beim Start
		config = function()
			-- Aktiviert das Farbschema
			vim.cmd.colorscheme("minischeme")
		end,
	},
}
