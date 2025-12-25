return {
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.3", -- Stabiler Fixpunkt gegen das aktuelle Chaos
		dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
		opts = {
			ensure_installed = { "bash", "c", "lua", "python", "markdown", "vim", "vimdoc", "glsl" },
			highlight = { enable = true },
			indent = { enable = true }, -- Aktiviert Treesitter-Indentation
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.outer",
						["ic"] = "@class.inner",
						["ai"] = "@conditional.outer",
						["ii"] = "@conditional.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
					selection_modes = {
						["@function.outer"] = "V",
						["@function.inner"] = "V",
						["@class.outer"] = "V",
						["@class.inner"] = "V",
						["@conditional.outer"] = "V",
						["@conditional.inner"] = "V",
						["@loop.outer"] = "V",
						["@loop.inner"] = "V",
					},
				},
				move = {
					enable = true,
					set_jumps = true,
					goto_next_start = { ["<Tab>"] = "@function.outer" },
					goto_previous_start = { ["<S-Tab>"] = "@function.outer" },
				},
			},
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
