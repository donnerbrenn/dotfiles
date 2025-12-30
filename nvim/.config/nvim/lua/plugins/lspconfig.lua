return {
	"neovim/nvim-lspconfig",
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

		-- 1. Globale Rundungen für LSP-Popups (Hover, Signature Help)
		local border = "rounded"
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
		vim.lsp.handlers["textDocument/signatureHelp"] =
			vim.lsp.with(vim.lsp.handlers.signatureHelp, { border = border })

		-- Rundungen für Diagnose-Fenster
		vim.diagnostic.config({
			float = { border = border },
		})

		-- 2. Mason Setup mit Rundungen
		require("mason").setup({
			ui = {
				border = border,
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		local servers = {
			clangd = {},
			pyright = {},
			lua_ls = {},
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, { "stylua" })

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

		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				require("core.keys").set_lsp_keys(event)
			end,
		})
	end,
}
