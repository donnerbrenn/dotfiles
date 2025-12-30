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

		-- 1. FIX: Globale Rundungen ohne Deprecation-Warnungen
		local border = "rounded"

		-- Wir sagen dem LSP explizit, dass das Überschreiben hier gewollt ist
		---@diagnostic disable-next-line: duplicate-set-field
		local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
			opts = opts or {}
			opts.border = opts.border or border
			return orig_util_open_floating_preview(contents, syntax, opts, ...)
		end
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
