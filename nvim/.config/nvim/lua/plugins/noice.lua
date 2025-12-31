return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {
		cmdline = {
			view = "cmdline_popup",
			format = {
				cmdline = { icon = "  ", lang = "vim" },
				search_down = { icon = "   ", lang = "regex" },
			},
		},
		routes = {
			{
				filter = {
					event = "msg_show",
					any = { { find = "written" } },
				},
				view = "mini",
			},
			{
				filter = { event = "notify" },
				view = "notify",
			},
		},
		views = {
			cmdline_popup = {
				border = {
					style = "rounded",
					highlight = "NoiceBorderBright",
				},
				position = { row = "40%", col = "50%" },
			},
			popupmenu = {
				relative = "editor",
				border = {
					style = "rounded",
					highlight = "NoiceBorderBright",
				},
			},
			hover = {
				border = {
					style = "rounded",
					highlight = "NoiceBorderBright",
				},
			},
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
	config = function(_, opts)
		require("notify").setup({
			stages = "fade",
			render = "minimal",
			timeout = 3000,
			background_colour = "#000000",
			merge_duplicates = true,
		})
		require("noice").setup(opts)
	end,
}
