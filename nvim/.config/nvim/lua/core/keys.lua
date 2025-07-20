vim.g.mapleader = " "
vim.g.maplocalleader = " "
local set = vim.keymap.set

-- Make surround a little bit easier to handle
set("n", "<leader>123", ':normal! ysi{"<CR>', { desc = 'Surround inner { with "' })
-- Select stuff
set("n", "<leader>y", 'm"ggVGy\'"', { desc = "Yank content of the entire buffer" })
set("n", "<leader>a", "ggVG", { desc = "Select content of the entire buffer" })
set("v", "<leader>rr", '"_dP', { desc = "Replace selection with yank register" })
set("n", "<leader>rw", 'viw"_dP', { desc = "Replace inner word with yank register" })
set("n", '<leader>r"', 'vi""_dP', { desc = 'Replace inner "" with yank register' })
set("n", "<leader>r{", 'vi{"_dP', { desc = "Replace inner {} with yank register" })
set("n", "<leader>r(", 'vi("_dP', { desc = "Replace inner () with yank register" })
set("n", "<leader>r[", 'vi["_dP', { desc = "Replace inner [] with yank register" })

--Config
set("n", "<leader>R", ":so %<CR>", { desc = "Reload config" })

-- Replace stuff
set("n", "<leader>p", [["_diw"+P]], { desc = "Clipboard paste (replace word under cursor)" })
set("v", "<leader>p", [["_d"+P]], { desc = "Clipboard paste (replace visual selection)" })

-- Insert empty lines
set("n", "<Enter>", "o<ESC>", { desc = "Insert empty line" })
set("n", "<S-Enter>", "O<ESC>", { desc = "Insert empty line above" })

--Sorting
set("n", "<leader>si", "vip:sort i<CR>", { desc = "Sort paragraph, ignore case" })
set("n", "<leader>siu", "vip:sort iu<CR>", { desc = "Sort paragraph, ignore case and deduplicate" })
set("n", "<leader>ss", "vip:sort<CR>", { desc = "Sort paragraph" })
set("n", "<leader>su", "vip:sort u<CR>", { desc = "Sort paragraph and deduplicate" })
set("v", "<leader>si", ":sort i<CR>", { desc = "Sort lines, ignore case" })
set("v", "<leader>ss", ":sort<CR>", { desc = "Sort lines" })
set("v", "<leader>su", ":sort u<CR>", { desc = "Sort lines and deduplicate" })

--cases
set("n", "<leader>ul", "guu", { desc = "Lower case for current line" })
set("n", "<leader>Ul", "gUU", { desc = "Upper case for current line" })
set("n", "<leader>up", "guip", { desc = "Lower case for current paragraph" })
set("n", "<leader>Up", "gUip", { desc = "Upper case for current paragraph" })
set("n", "<leader>uw", "guiw", { desc = "Lower case for current word" })
set("n", "<leader>Uw", "gUiw", { desc = "Upper case for current word" })
set("n", "<leader>~l", "g~~", { desc = "Invert case for current line" })
set("n", "<leader>~p", "g~ip", { desc = "Invert case for current paragraph" })
set("n", "<leader>~w", "g~iw", { desc = "Invert case for current word" })

-- Buffers
set("n", "<C-b>", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Move around
set("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-left>", "<cmd>bp<CR>", { desc = "Jump to previous buffer" })
set("n", "<C-right>", "<cmd>bn<CR>", { desc = "Jump to next buffer" })
set("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })
set("n", "<M-h>", "zH", { desc = "Move left" })
set("n", "<M-j>", "<C-d>zz", { desc = "Move down and center" })
set("n", "<M-k>", "<C-u>zz", { desc = "Move up and center" })
set("n", "<M-l>", "zL", { desc = "Move right" })
set("n", "<leader>j", ":cprev<CR>", { desc = "cprev" })
set("n", "<leader>k", ":cnext<CR>", { desc = "cnext" })
set("n", "M-j", "j^", { desc = "Goto to the beginning of the next line" })
set("n", "M-up", "k^", { desc = "Goto to the beginning of the previous line" })

-- Move stuff around
set("n", "<C-down>", "<cmd>m +1<CR>", { desc = "Move line down" })
set("n", "<C-up>", "<cmd>m -2<CR>", { desc = "Move line up" })

-- Lazy
set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Go to Lazy" })
set("n", "<leader>lu", "<cmd>Lazy update<CR>", { desc = "Lazy update" })

-- Line numbers
set("n", "<leader>nl", "<cmd>set rnu!<CR>", { desc = "Toggle relative line numbers" })

-- Highlighting
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
-- MiniComment.toggle_lines(line_start, line_end, opts)
-- Split windows
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-s>", "<C-W>-")
set("n", "<M-t>", "<C-W>+")
set("n", "<leader>we", "<C-w>=", { desc = "Distribute windows equally" })
set("n", "<leader>wh", "<C-w>s", { desc = "Create horizontal split" })
set("n", "<leader>wv", "<C-w>v", { desc = "Create verical split" })
set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current window" })
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- Deactivate cursor keys
set("n", "<ScrollWheelDown>", '<cmd>echo "Use the keyboard!"<CR>', { desc = "How about no?" })
set("n", "<ScrollWheelUp>", '<cmd>echo "Use the keyboard!"<CR>', { desc = "How about no?" })
set("n", "<down>", '<cmd>echo "Use j!"<CR>', { desc = "How about no?" })
set("n", "<left>", '<cmd>echo "Use h!"<CR>', { desc = "How about no?" })
set("n", "<right>", '<cmd>echo "Use l!"<CR>', { desc = "How about no?" })
set("n", "<up>", '<cmd>echo "Use k!"<CR>', { desc = "How about no?" })
