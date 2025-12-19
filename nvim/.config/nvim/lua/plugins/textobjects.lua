return {
	"nvim-treesitter/nvim-treesitter-textobjects",
	lazy = false, -- Wir laden es direkt, damit die Textobjekte sofort verfügbar sind
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	config = function()
		require("nvim-treesitter.configs").setup({
			textobjects = {
				-- 1. AUSWÄHLEN (Select)
				-- Nutze 'v', 'd', 'c', 'y' gefolgt von der Map (z.B. 'dif' zum Löschen)
				select = {
					enable = true,
					lookahead = true, -- Springt automatisch zum nächsten Objekt
					keymaps = {
						-- Funktionen & Klassen
						["af"] = { query = "@function.outer", desc = "Select outer part of a function" },
						["if"] = { query = "@function.inner", desc = "Select inner part of a function" },
						["ac"] = { query = "@class.outer", desc = "Select outer part of a class" },
						["ic"] = { query = "@class.inner", desc = "Select inner part of a class" },

						-- Loops & Conditionals (if/else)
						["ai"] = { query = "@conditional.outer", desc = "Select outer part of a conditional" },
						["ii"] = { query = "@conditional.inner", desc = "Select inner part of a conditional" },
						["al"] = { query = "@loop.outer", desc = "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", desc = "Select inner part of a loop" },

						-- Parameter, Zuweisungen & Calls
						["ap"] = { query = "@parameter.outer", desc = "Select outer part of a parameter" },
						["ip"] = { query = "@parameter.inner", desc = "Select inner part of a parameter" },
						["aa"] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["ia"] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["ad"] = { query = "@call.outer", desc = "Select outer part of a function call" },
						["id"] = { query = "@call.inner", desc = "Select inner part of a function call" },
					},
				},

				-- Springe schnell durch deinen Code
				move = {
					enable = true,
					set_jumps = true, -- Fügt die Sprünge zur History (Ctrl-o / Ctrl-i) hinzu
					goto_next_start = {
						["<D-j>"] = { query = "@function.outer", desc = "Next function start" },
					},
					goto_previous_start = {
						["<D-k>"] = { query = "@function.outer", desc = "Previous function start" },
					},
				},

				-- Tausche die aktuelle Funktion/Parameter mit dem nächsten/vorherigen
				swap = {
					enable = true,
					swap_next = {
						["<C-j>"] = { query = "@function.outer", desc = "Swap with next function" },
						["<C-l>"] = { query = "@parameter.inner", desc = "Swap with next parameter" },
					},
					swap_previous = {
						["<C-k>"] = { query = "@function.outer", desc = "Swap with previous function" },
						["<C-h>"] = { query = "@parameter.inner", desc = "Swap with previous parameter" },
					},
				},
			},
		})
	end,
}
