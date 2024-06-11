return {
	'folke/flash.nvim',
	event = 'VeryLazy',
	---@type Flash.Config
	opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "<leader>jr", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "<leader>jR", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<leader>jt", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}
