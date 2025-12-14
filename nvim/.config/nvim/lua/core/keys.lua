vim.g.mapleader = " "
vim.g.maplocalleader = " "
local set = vim.keymap.set

-- === BASICS & SELECTION ===
set("n", "<leader>a", "ggVG", { desc = "Select All" })
set("n", "<leader>y", "mzggVGy`z", { desc = "Yank All" })
set("x", "<leader>p", [["_dP]], { desc = "Paste (Keep Register)" }) -- Das "Black Hole" Paste

-- === INSERTING ===
set("n", "<leader>o", "o<ESC>", { desc = "Insert Line Below" })
set("n", "<leader>O", "O<ESC>", { desc = "Insert Line Above" })

-- === BUFFERS ===
set("n", "<leader>q", "<cmd>bd<CR>", { desc = "Close Buffer" })
set("n", "<S-h>", "<cmd>bp<CR>", { desc = "Prev Buffer" })
set("n", "<S-l>", "<cmd>bn<CR>", { desc = "Next Buffer" })

-- === WINDOWS ===
-- Navigation
set("n", "<C-h>", "<C-w>h", { desc = "Focus Left" })
set("n", "<C-j>", "<C-w>j", { desc = "Focus Down" })
set("n", "<C-k>", "<C-w>k", { desc = "Focus Up" })
set("n", "<C-l>", "<C-w>l", { desc = "Focus Right" })

-- Management
set("n", "<leader>wd", "<C-w>q", { desc = "Close Window" }) -- Falls du nur das Fenster, nicht den Buffer schließen willst
set("n", "<leader>wv", "<C-w>v", { desc = "Split Vertical" })
set("n", "<leader>wh", "<C-w>s", { desc = "Split Horizontal" })
set("n", "<leader>we", "<C-w>=", { desc = "Equalize Sizes" })

-- Resizing (Pfeile erlaubt hier)
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

-- === SORTING ===
set("v", "<leader>ss", ":sort<CR>", { desc = "Sort Lines" })
set("v", "<leader>su", ":sort u<CR>", { desc = "Sort Unique" })
set("n", "<leader>s", "vip:sort<CR>", { desc = "Sort Paragraph" })

-- === MISC ===
set("n", "<leader>R", "<cmd>so %<CR>", { desc = "Reload Config" })
set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear Highlight" })
set("n", "<leader>123", 'ysi{"', { desc = "Surround with Quote" })

-- Hardcore Mode
local msg = [[<cmd>echo "Use hjkl!"<CR>]]
set({ "n", "i", "v" }, "<Left>", msg, { desc = "Don't touch!" })
set({ "n", "i", "v" }, "<Right>", msg, { desc = "Don't touch!" })
set({ "n", "i", "v" }, "<Up>", msg, { desc = "Don't touch!" })
set({ "n", "i", "v" }, "<Down>", msg, { desc = "Don't touch!" })
