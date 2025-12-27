return {
	"mfussenegger/nvim-dap",
	-- 1. TRIGGER: Wir definieren die Tasten hier oben.
	-- Sobald eine gedrückt wird, lädt lazy.nvim alles andere.
	keys = {
		{
			"<leader>td",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle Debugger UI",
		},
		{
			"<F5>",
			function()
				require("dap").continue()
			end,
			desc = "Debug: Start/Continue",
		},
		{
			"<F1>",
			function()
				require("dap").step_into()
			end,
			desc = "Debug: Step Into",
		},
		{
			"<F2>",
			function()
				require("dap").step_over()
			end,
			desc = "Debug: Step Over",
		},
		{
			"<F3>",
			function()
				require("dap").step_out()
			end,
			desc = "Debug: Step Out",
		},
		{
			"<leader>tb",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Debug: Toggle Breakpoint",
		},
		{
			"<leader>tB",
			function()
				require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
			end,
			desc = "Debug: Set Breakpoint",
		},
		{
			"<F7>",
			function()
				require("dapui").toggle()
			end,
			desc = "Debug: See last session result.",
		},
	},

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		-- Deine Debugger-Liste
		"leoluz/nvim-dap-go",
		"mfussenegger/nvim-dap-python",
		"rogalmic/vscode-bash-debug",
		"vadimcn/vscode-lldb",
		"microsoft/vscode-cpptools",
		"microsoft/debugpy",
		"go-delve/delve",
		"tomblind/local-lua-debugger-vscode",
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Mason-DAP Setup
		require("mason-nvim-dap").setup({
			automatic_installation = true,
			handlers = {},
			ensure_installed = {},
		})

		-- DAP UI Setup (Deine Icons und Einstellungen)
		dapui.setup({
			-- Deine Icons bleiben gleich
			icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
			controls = {
				enabled = true,
				element = "repl",
				icons = {
					pause = "",
					play = "",
					step_into = "",
					step_over = "",
					step_out = "",
					step_back = "",
					run_last = "",
					terminate = "",
					disconnect = "",
				},
			},
			-- HIER definierst du die Aufteilung:
			layouts = {
				{
					-- Seitenleiste (Links)
					elements = {
						{ id = "scopes", size = 0.35 }, -- Wo bin ich?
						{ id = "stacks", size = 0.35 }, -- Call Stack
						{ id = "breakpoints", size = 0.15 },
						{ id = "watches", size = 0.15 },
					},
					position = "left",
					size = 40,
				},
				{
					-- Untere Leiste
					elements = {
						{ id = "repl", size = 0.45 },
						{ id = "console", size = 0.55 },
					},
					position = "bottom",
					size = 10, -- Höhe des unteren Fensters
				},
			},
		})
		-- Listeners
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Go Setup
		require("dap-go").setup({
			delve = {
				detached = vim.fn.has("win32") == 0,
			},
		})
	end,
}
