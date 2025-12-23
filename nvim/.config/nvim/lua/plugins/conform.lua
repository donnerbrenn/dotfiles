return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" }, -- Lädt das Plugin automatisch beim Speichern
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "n",
			desc = "Format buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Hier kannst du Sprachen hinzufügen, die KEIN LSP-Fallback nutzen sollen
			local disable_filetypes = { c = true, cpp = true }
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "ruff_format", "ruff_organize_imports" },
			json = { "prettierd", "jq" },
			jsonc = { "prettierd" },
			rust = { "rustfmt" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			zsh = { "beautysh" },
			sh = { "beautysh" },
			go = { "goimports", "gofmt" },
			html = { "prettierd" },
			yaml = { "prettierd" },
			sql = { "sqlfmt" },
			["_"] = { "trim_whitespace" },
		},
	},
}
