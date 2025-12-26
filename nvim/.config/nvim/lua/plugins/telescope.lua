return {
	"nvim-telescope/telescope.nvim",
	-- TRIGGER: Lädt erst beim Drücken der Keys
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
			desc = '[S]earch Recent Files ("." for repeat)',
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
				require("telescope.builtin").colorscheme()
			end,
			desc = "[S]earch colorscheme",
		},
		{
			"<leader>s/",
			function()
				require("telescope.builtin").live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
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
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			pickers = {
				find_files = { theme = "ivy" },
				live_grep = { theme = "ivy" },
				colorscheme = { theme = "dropdown" },
			},
			extensions = {
				["ui-select"] = { require("telescope.themes").get_dropdown() },
			},
		})

		-- Extensions erst laden, wenn die Config-Funktion läuft
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
	end,
}
