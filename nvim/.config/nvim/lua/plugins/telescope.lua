return {
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>sh",
			function()
				require("telescope.builtin").help_tags()
			end,
			desc = "[S]earch [H]elp",
		},
		{
			"<leader>sk",
			function()
				require("telescope.builtin").keymaps()
			end,
			desc = "[S]earch [K]eymaps",
		},
		{
			"<leader>sf",
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "[S]earch [F]iles",
		},
		{
			"<leader>sm",
			function()
				require("telescope.builtin").man_pages()
			end,
			desc = "[S]earch [M]anpages",
		},
		{
			"<leader>ss",
			function()
				require("telescope.builtin").builtin()
			end,
			desc = "[S]earch [S]elect Telescope",
		},
		{
			"<leader>sw",
			function()
				require("telescope.builtin").grep_string()
			end,
			desc = "[S]earch current [W]ord",
		},
		{
			"<leader>sg",
			function()
				require("telescope.builtin").live_grep()
			end,
			desc = "[S]earch by [G]rep",
		},
		{
			"<leader>sd",
			function()
				require("telescope.builtin").diagnostics()
			end,
			desc = "[S]earch [D]iagnostics",
		},
		{
			"<leader>sr",
			function()
				require("telescope.builtin").resume()
			end,
			desc = "[S]earch [R]esume",
		},
		{
			"<leader>s.",
			function()
				require("telescope.builtin").oldfiles()
			end,
			desc = "[S]earch Recent Files",
		},
		{
			"<leader><leader>",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find()
			end,
			desc = "Find in current buffer",
		},
		{
			"<leader>sb",
			function()
				require("telescope.builtin").buffers()
			end,
			desc = "[S]earch existing buffers",
		},
		{
			"<leader>sc",
			function()
				require("telescope.builtin").colorscheme({ enable_preview = true })
			end,
			desc = "[S]earch colorscheme",
		},
		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({ grep_open_files = true })
			end,
			desc = "[S]earch [/] in Open Files",
		},
		{
			"<leader>sn",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "[S]earch [N]eovim files",
		},
	},
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "echasnovski/mini.icons", opts = {} },
	},
	config = function()
		local icons = require("mini.icons")
		icons.setup()
		icons.mock_nvim_web_devicons()

		local bright_white = "#ffffff"
		local telescope_hl = {
			TelescopeBorder = { fg = bright_white },
			TelescopePromptBorder = { fg = bright_white },
			TelescopeResultsBorder = { fg = bright_white },
			TelescopePreviewBorder = { fg = bright_white },
			TelescopePromptTitle = { fg = bright_white, bold = true },
			TelescopeResultsTitle = { fg = bright_white, bold = true },
			TelescopePreviewTitle = { fg = bright_white, bold = true },
		}

		for hl, col in pairs(telescope_hl) do
			vim.api.nvim_set_hl(0, hl, col)
		end

		require("telescope").setup({
			defaults = {
				path_display = { "filename_first" },
				sorting_strategy = "ascending",
				layout_config = {
					horizontal = { prompt_position = "top", preview_width = 0.55 },
				},
			},
			pickers = {
				find_files = { theme = "ivy" },
				live_grep = { theme = "ivy" },
			},
		})
	end,
}
