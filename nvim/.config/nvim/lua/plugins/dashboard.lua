return {
	"nvimdev/dashboard-nvim",
	lazy = true,
	cond = function()
		return vim.fn.argc() == 0
	end,
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "doom",
			config = {
				header = {
					[[                                                   ]],
					[[                                                   ]],
					[[                                                   ]],
					[[                                                   ]],
					[[                                                   ]],
					[[  _____   __                                       ]],
					[[  ___  | / /_____ ______ ___   _____(_)_________   ]],
					[[  __   |/ / _  _ \_  __ \__ | / /__  / __  __  /   ]],
					[[  _  /|  /  /  __// /_/ /__ |/ / _  / / / / / /    ]],
					[[  /_/ |_/   \___/ \____/ _____/  /_/ / /_/ /_/     ]],
					[[                                                   ]],
					[[                                                   ]],
					[[                                                   ]],
					[[                                                   ]],
				},
				center = {
					{ icon = "📄 ", desc = "New File            ", key = "e", action = "ene" },
					{ icon = "🔍 ", desc = "Find File           ", key = "f", action = "Telescope find_files" },
					{ icon = "🕘 ", desc = "Recent Files        ", key = "r", action = "Telescope oldfiles" },
					{ icon = "✨ ", desc = "Find Text           ", key = "g", action = "Telescope live_grep" },
					{
						icon = "⚙️ ",
						desc = "Config              ",
						key = "c",
						action = "e " .. vim.fn.stdpath("config") .. "/init.lua",
					},
					{ icon = "💤 ", desc = "Lazy                ", key = "l", action = "Lazy" },
					{ icon = "❌ ", desc = "Quit                ", key = "q", action = "qa" },
				},
				footer = function()
					local stats = require("lazy").stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					return {
						"",
						"",
						"⚡ Status: " .. stats.loaded .. "/" .. stats.count .. " plugins loaded in " .. ms .. "ms",
					}
				end,
			},
		})

		-- Tilden-Killer bleibt aktiv
		vim.opt.fillchars:append({ eob = " " })

		-- Highlight-Gruppen (Material-Look)
		local set_hl = vim.api.nvim_set_hl
		set_hl(0, "DashboardHeader", { fg = "#82aaff", bold = true })
		set_hl(0, "DashboardIcon", { fg = "#ffcb6b" })
		set_hl(0, "DashboardKey", { fg = "#c3e88d", bold = true })
		set_hl(0, "DashboardDesc", { fg = "#ffffff" })
		set_hl(0, "DashboardFooter", { fg = "#546e7a", italic = true })
	end,
}
