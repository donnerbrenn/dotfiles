return { -- Autoformat
	"stevearc/conform.nvim",
	lazy = false,
	keys = {
		{
			"<leader>bb",
			function()
				require("conform").format({ async = true, lsp_fallback = true })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			-- Disable "format_on_save lsp_fallback" for languages that don't
			-- have a well standardized coding style. You can add additional
			-- languages here or re-enable it for the disabled ones.
			local disable_filetypes = {}
			return {
				timeout_ms = 500,
				lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			python = { "autopep8" },
			json = { "jq" },
			jsonc = { "jq" },
			rust = { "ast-grep" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			zsh = { "beautysh" },
			sh = { "beautysh" },
			go = { "crlfmt" },
			html = { "prettierd" },
			yaml = { "prettierd" },
			sql = { "sqlfmt" },
		},
	},
}
