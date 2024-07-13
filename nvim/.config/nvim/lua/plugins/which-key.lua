return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()
		local wk = require("which-key")
		wk.add({
			{ "<leader>c", desc = "[C]ode" },
			{ "<leader>d", desc = "[D]ocument" },
			{ "<leader>r", desc = "[R]ename" },
			{ "<leader>s", desc = "[S]earch" },
			{ "<leader>w", desc = "[W]workspace" },
			{ "<leader>t", desc = "[T]oggle" },
			{ "<leader>h", desc = "Git [H]unk" },
		})

		-- Document existing key chains
		-- require("which-key").register({
		-- ["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		-- ["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		-- ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		-- ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		-- ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
		-- ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
		-- })
		-- visual mode
	end,
}
