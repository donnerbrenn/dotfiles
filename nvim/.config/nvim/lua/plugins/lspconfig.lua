return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"saghen/blink.cmp", -- WICHTIG: Hier wieder als Abhängigkeit eintragen!
	},
	config = function()
		-- Hier stellen wir sicher, dass wir die Capabilities sicher abrufen
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		-- Prüfen, ob Blink geladen ist, bevor wir es abrufen
		local status_ok, blink = pcall(require, "blink.cmp")
		if status_ok then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		-- Dein LspAttach Autocmd bleibt gleich
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(event)
				require("core.keys").set_lsp_keys(event)
				-- ... (dein restlicher Code für Highlighting etc.)
			end,
		})

		local servers = {
			clangd = {},
			pyright = {},
			lua_ls = {},
			-- ... (deine restlichen Server)
		}

		require("mason").setup()
		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- Hier werden die Capabilities injiziert
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
