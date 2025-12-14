return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			size = 15,
			-- HIER IST DIE ÄNDERUNG:
			open_mapping = [[<C-t>]], -- Statt <leader>t lieber Strg+t
			hide_numbers = true,
			shade_terminals = true,
			shading_factor = 1,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true,
			shell = vim.o.shell,
		})

		-- ... deine restlichen Mappings ...
		-- (Die sind gut so, lassen wir unverändert)
		-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
		vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })
	end,
}
