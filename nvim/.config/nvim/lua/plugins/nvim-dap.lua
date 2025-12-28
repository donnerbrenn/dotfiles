return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	-- Trigger über Keys ODER wenn du ein Python/Go File öffnest
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
	-- Zusätzlicher Trigger für Dateitypen
	ft = { "python", "go", "cpp", "c", "rust" },

	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"williamboman/mason.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		-- Nur echte Neovim-Plugins hier lassen!
		"leoluz/nvim-dap-go",
		-- Python DAP explizit als Lazy-Dependency
		{ "mfussenegger/nvim-dap-python", ft = "python" },
	},

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")

		-- Mason-DAP Setup: Hier kommen die externen Debugger rein!
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"python",
				"codelldb",
				"bash-debug-adapter",
			},
			automatic_installation = true,
			handlers = {
				-- Standard-Handler für automatische Konfiguration
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})

		-- DAP UI Setup
		dapui.setup({
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
			layouts = {
				{
					elements = {
						{ id = "scopes", size = 0.35 },
						{ id = "stacks", size = 0.35 },
						{ id = "breakpoints", size = 0.15 },
						{ id = "watches", size = 0.15 },
					},
					position = "left",
					size = 40,
				},
				{
					elements = { { id = "repl", size = 0.45 }, { id = "console", size = 0.55 } },
					position = "bottom",
					size = 10,
				},
			},
		})

		-- Automatisches UI öffnen/schließen
		dap.listeners.after.event_initialized["dapui_config"] = dapui.open
		dap.listeners.before.event_terminated["dapui_config"] = dapui.close
		dap.listeners.before.event_exited["dapui_config"] = dapui.close

		-- Adapter-spezifische Konfigurationen
		require("dap-go").setup()

		-- Python Pfad finden und Setup (nur wenn Plugin geladen)
		local status_ok, dap_python = pcall(require, "dap-python")
		if status_ok then
			dap_python.setup("python3")
		end
	end,
}
