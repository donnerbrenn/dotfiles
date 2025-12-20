return { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VimEnter", -- Sets the loading event to 'VimEnter'
	config = function() -- This is the function that runs, AFTER loading
		require("which-key").setup()
		local wk = require("which-key")
		wk.add({
			{ "<leader>s", desc = "[D]ebugger" },
			-- { "<leader>l", desc = "[L]sp" },
			{ "<leader>q", desc = "[Q]uit" },
			{ "<leader>s", desc = "[S]earch" },
			{ "<leader>p", desc = "[P]ackages" },
			{ "<leader>t", desc = "[T]oggle" },
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
