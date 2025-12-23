return {
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Einstellungen, die geladen werden MÜSSEN, bevor das Plugin startet
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_navigation = 1
			-- Hier kannst du z.B. festlegen, wo deine Queries gespeichert werden
			-- vim.g.db_ui_save_location = "~/queries"
		end,
	},
}
