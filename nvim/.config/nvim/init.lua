-- Disable some built-in vim plugins at the very start
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit",
}

for _, plugin in ipairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.g.have_nerd_font = true
if vim.loader then
	vim.loader.enable()
end
require("core.options")
require("core.highlights")
require("core.autocmds")
require("core.keys")
require("core.lazy")
require("core.diagnostics")
