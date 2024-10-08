return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
	-- stylua: ignore
	keys = {
		{ "<leader>g", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
		{ "<leader>G", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		-- { "<leader>lr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		-- { "<leader>lR", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		-- { "<leader>lt", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},
}
