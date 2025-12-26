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
