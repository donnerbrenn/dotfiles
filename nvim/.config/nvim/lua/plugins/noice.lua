-- lazy.nvim config
return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "written" },
					},
				},
				view = "mini",
			},
			{
				filter = { event = "notify" },
				view = "notify",
			},
		},
		views = {
			notify = {
				replace = true,
				merge = true,
			},
		},
		presets = {
			bottom_search = false,
			command_palette = false,
			long_message_to_split = true,
			lsp_doc_border = true,
		},
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function(_, opts)
		require("notify").setup({
			stages = "fade",
			render = "minimal",
			timeout = 5000,
			-- Diese Zeile behebt den Fehler aus deinem Screenshot:
			background_colour = "#1a1b26",
			merge_duplicates = true,
		})
		require("noice").setup(opts)
	end,
}
