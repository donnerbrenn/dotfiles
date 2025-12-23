-- lua/plugins/lsp.lua
return {
	"neovim/nvim-lspconfig",
	dependencies = {
		-- Modernes Lua-Setup für Neovim Configs (Ersatz für neodev)
		{ "folke/lazydev.nvim", ft = "lua", opts = {} },
		{ "williamboman/mason.nvim", config = true },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		{ "j-hui/fidget.nvim", opts = {} },
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		-- 1. Keybindings via Autocommand laden
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				-- Hier rufen wir deine Keys auf!
				require("core.keys").set_lsp_keys(event)

				-- Highlighting Logik (Bleibt hier, da es kein Keybinding ist)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.server_capabilities.documentHighlightProvider then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})
					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})
				end
			end,
		})

		-- 2. Capabilities für Autocompletion vorbereiten
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		-- 3. Server definieren
		local servers = {
			jq = {},
			debugpy = {},
			clangd = {
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--header-insertion=iwyu",
					"--completion-style=detailed",
					"--function-arg-placeholders",
					"--fallback-style=llvm",
				},
				init_options = {
					fallbackFlags = { "-std=c11" },
				},
			},
			glsl_analyzer = {},
			pyright = {
				settings = {
					pyright = {
						-- Nutzt Ruff für Import-Organisation
						disableOrganizeImports = true,
					},
					python = {
						analysis = {
							-- "ignore" lässt Ruff das Linting übernehmen,
							-- Pyright bleibt für Type-Checking zuständig
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "workspace",
						},
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = { callSnippet = "Replace" },
						diagnostics = {
							globals = { "vim" }, -- Verhindert Warnungen bei der Neovim-API
						},
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
								-- Damit erkennt der LSP auch Plugins in deinem Config-Ordner
								"${3rd}/luv/library",
							},
						},
						telemetry = { enable = false },
					},
				},
			},
			ruff = {
				-- Verhindert, dass Ruff Hover-Dokumentation anzeigt (das soll Pyright machen)
				on_attach = function(client)
					client.server_capabilities.hoverProvider = false
				end,
			},
		}

		-- 4. Mason Setup & Automatisches Server-Setup
		require("mason").setup()
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"prettierd",
			"clang-format",
			"beautysh",
			"sqlfmt",
			"jq",
			"debugpy",
			"codelldb",
			"bash-debug-adapter",
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
	end,
}
