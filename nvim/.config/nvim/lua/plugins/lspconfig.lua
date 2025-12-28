return {
	"neovim/nvim-lspconfig",
	-- WICHTIG: 'VeryLazy' sorgt dafür, dass Mason auch ohne Datei nach dem Start lädt
	event = { "BufReadPre", "BufNewFile", "VeryLazy" },
	dependencies = {
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		local status_ok, blink = pcall(require, "blink.cmp")
		if status_ok then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		-- Deine LSP-Liste für Mason
		local servers = {
			clangd = {},
			pyright = {},
			lua_ls = {},
			-- hier weitere Server ergänzen
		}

		-- Mason Setup
		require("mason").setup()

		-- WICHTIG: Mason-Tool-Installer muss hier explizit konfiguriert werden!
		-- Das war wahrscheinlich der Grund, warum die Liste leer blieb.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua", -- Beispiel für Formatter
		})

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		-- Dein LspAttach Autocmd
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				require("core.keys").set_lsp_keys(event)
			end,
		})
	end,
}
