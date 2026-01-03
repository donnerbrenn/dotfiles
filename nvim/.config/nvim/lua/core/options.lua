vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.signcolumn = "yes"
vim.opt.laststatus = 3
vim.opt.confirm = true
vim.opt.smoothscroll = true
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.inccommand = "split"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 1000
vim.opt.scrolloff = 8
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.filetype.add({
	extension = {
		frag = "glsl",
		vert = "glsl",
		comp = "glsl",
		jsonc = "json",
	},
})
