vim.g.maplocalleader = " "
vim.g.mapleader = " "
local set = vim.keymap.set

-- === BASICS & SELECTION ===
set("n", "<leader>a", "ggVG", { desc = "Select All" })
set("n", "<leader>y", "mzggVGy`z", { desc = "Yank All" })
set("x", "<leader>p", [["_dP]], { desc = "Paste (Keep Register)" })

-- === INSERTING ===
set("n", "<leader>o", "o<ESC>", { desc = "Insert Line Below" })
set("n", "<leader>O", "O<ESC>", { desc = "Insert Line Above" })

-- === BUFFERS ===
set("n", "<leader>bc", "<cmd>bd<CR>", { desc = "Close buffer" })
set("n", "<leader>bw", "<cmd>w<CR>", { desc = "Write buffer" })
set("n", "<S-h>", "<cmd>bp<CR>", { desc = "Prev buffer" })
set("n", "<S-l>", "<cmd>bn<CR>", { desc = "Next buffer" })

-- === WINDOWS ===
set("n", "<leader>wc", "<C-w>q", { desc = "Close window" })
set("n", "<leader>wm", ":resize | vertical resize<CR>", { desc = "Maximize window" })
set("n", "<leader>we", "<C-w>=", { desc = "Equal windows" })
set("n", "<leader>wv", "<C-w>v", { desc = "Vertical split" })
set("n", "<leader>wh", "<C-w>s", { desc = "Horizontal split" })
-- Navigation
set("n", "<C-j>", "<C-w>j", { desc = "Focus Down" })
set("n", "<C-k>", "<C-w>k", { desc = "Focus Up" })
set("n", "<C-l>", "<C-w>l", { desc = "Focus Right" })
set("n", "<C-h>", "<C-w>h", { desc = "Focus Left" })

-- Resizing (Arrows allowed here)
set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Resize Height +" })
set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Resize Height -" })
set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize Width -" })
set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize Width +" })

-- === MOVING & SCROLLING ===
set("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
set("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })
set("n", "n", "nzzzv", { desc = "Next Result" })
set("n", "N", "Nzzzv", { desc = "Prev Result" })

-- Move Lines (Alt + j/k)
set("n", "<M-j>", "<cmd>m .+1<CR>==", { desc = "Move Line Down" })
set("n", "<M-k>", "<cmd>m .-2<CR>==", { desc = "Move Line Up" })
set("i", "<M-j>", "<Esc><cmd>m .+1<CR>==gi", { desc = "Move Line Down" })
set("i", "<M-k>", "<Esc><cmd>m .-2<CR>==gi", { desc = "Move Line Up" })
set("v", "<M-j>", ":m '>+1<CR>gv=gv", { desc = "Move Selection Down" })
set("v", "<M-k>", ":m '<-2<CR>gv=gv", { desc = "Move Selection Up" })

-- Indentation (Alt + h/l)
set("n", "<M-h>", "<<", { desc = "Indent Left" })
set("n", "<M-l>", ">>", { desc = "Indent Right" })
set("i", "<M-h>", "<C-d>", { desc = "Indent Left" })
set("i", "<M-l>", "<C-t>", { desc = "Indent Right" })
set("v", "<M-h>", "<gv", { desc = "Indent Selection Left" })
set("v", "<M-l>", ">gv", { desc = "Indent Selection Right" })

-- === SORTING ===
set("v", "<leader>cs", ":sort<CR>", { desc = "Sort Lines" })
set("v", "<leader>cu", ":sort u<CR>", { desc = "Sort Unique" })
set("n", "<leader>cc", "vip:sort<CR>", { desc = "Sort Paragraph" })

-- === MISC ===
set("n", "<leader>R", "<cmd>so %<CR>", { desc = "Reload Config" })
set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { desc = "Clear Highlight and Escape" })
-- Hardcore Mode
local msg = [[<cmd>echo "Use hjkl!"<CR>]]
set({ "n", "i", "v" }, "<Left>", msg, { desc = "Don't touch!" })
set({ "n", "i", "v" }, "<Right>", msg, { desc = "Don't touch!" })
set({ "n", "i", "v" }, "<Up>", msg, { desc = "Don't touch!" })
set({ "n", "i", "v" }, "<Down>", msg, { desc = "Don't touch!" })

-- === DIAGNOSTICS ===
set("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show Diagnostic Error" })
-- set("n", "<leader>0", vim.diagnostic.setloclist, { desc = "Open quickfix list" })
set("n", "dk", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Prev Diagnostic" })
set("n", "dj", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next Diagnostic" })

-- === MASON ===
set("n", "<leader>pm", "<cmd>Mason<CR>", { desc = "Mason " })
set("n", "<leader>pmu", "<cmd>MasonUpdate<CR>", { desc = "Mason update" })
--
-- === LAZY ===
set("n", "<leader>pl", "<cmd>Lazy<CR>", { desc = "Go to Lazy" })
set("n", "<leader>pu", "<cmd>Lazy update<CR>", { desc = "Lazy update" })

-- === OUTLINE ===
set("n", "<leader>to", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

-- === NVIM TREE ===
set("n", "<leader>te", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
set("n", "<leader>tf", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle find file" })
-- set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
-- set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })

-- === FLASH ===
set({ "n", "x", "o" }, "<leader>jf", function()
	require("flash").jump()
end, { desc = "Flash" })
set({ "n", "x", "o" }, "<leader>jF", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-- -- === TREESJ ===
vim.keymap.set("n", "<leader>cm", function()
	require("treesj").toggle()
end, { desc = "Code: Toggle Split/Join" })
vim.keymap.set("n", "<leader>cs", function()
	require("treesj").split()
end, { desc = "Code: Split Block" })
vim.keymap.set("n", "<leader>cj", function()
	require("treesj").join()
end, { desc = "Code: Join Block" })

-- === LSP ===
local M = {}
-- Die Funktion für deine LSP-Bindings
M.set_lsp_keys = function(event)
	-- Telescope LSP Funktionen
	set(
		"n",
		"<leader>ld",
		require("telescope.builtin").lsp_definitions,
		{ buffer = event.buf, desc = "LSP: Goto [D]efinition" }
	)
	set(
		"n",
		"<leader>lr",
		require("telescope.builtin").lsp_references,
		{ buffer = event.buf, desc = "LSP: Goto [R]eferences" }
	)
	set(
		"n",
		"<leader>li",
		require("telescope.builtin").lsp_implementations,
		{ buffer = event.buf, desc = "LSP: Goto [I]mplementation" }
	)
	set(
		"n",
		"<leader>lD",
		require("telescope.builtin").lsp_type_definitions,
		{ buffer = event.buf, desc = "LSP: Type [D]efinition" }
	)
	set(
		"n",
		"<leader>ls",
		require("telescope.builtin").lsp_document_symbols,
		{ buffer = event.buf, desc = "LSP: Document [S]ymbols" }
	)
	set(
		"n",
		"<leader>lws",
		require("telescope.builtin").lsp_dynamic_workspace_symbols,
		{ buffer = event.buf, desc = "LSP: [W]orkspace [S]ymbols" }
	)

	-- Direkte LSP Befehle
	set("n", "<leader>ln", vim.lsp.buf.rename, { buffer = event.buf, desc = "LSP: Re[n]ame" })
	set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = event.buf, desc = "LSP: Code [A]ction" })
	set("n", "<leader>lk", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP: Hover Documentation" })
	set("n", "<leader>lgD", vim.lsp.buf.declaration, { buffer = event.buf, desc = "LSP: [G]oto [D]eclaration" })
	set("n", "<leader>lI", "<cmd>LspInfo<CR>", { desc = "LSP: Info" })
	set("n", "<leader>lR", "<cmd>LspRestart<CR>", { desc = "LSP: Restart" })
	-- Inlay Hints Toggle (bedingt durch Server-Support)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
		set("n", "<leader>th", function()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
		end, { buffer = event.buf, desc = "LSP: [T]oggle Inlay [H]ints" })
	end
end

return M
