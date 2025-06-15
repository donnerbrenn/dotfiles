vim.g.mapleader = " "
vim.g.maplocalleader = " "
local set = vim.keymap.set
--Config
set("n", "<leader>R", ":so %<CR>", { desc = "Reload config" })

-- Insert empty lines
set("n", "<Enter>", "o<ESC>", { desc = "Insert empty line" })
set("n", "<S-Enter>", "O<ESC>", { desc = "Insert empty line above" })

--Sorting
set("v", "<leader>si", ":sort i<CR>", { desc = "Sort lines, ignore case" })
set("v", "<leader>ss", ":sort<CR>", { desc = "Sort lines" })
set("v", "<leader>su", ":sort u<CR>", { desc = "Sort lines and deduplicate" })

--cases
set("n", "<leader>~w", "g~iw", { desc = "Invert case for current word" })
set("n", "<leader>~p", "g~ip", { desc = "Invert case for current paragraph" })
set("n", "<leader>~l", "g~~", { desc = "Invert case for current line" })
set("n", "<leader>Uw", "gUiw", { desc = "Upper case for current word" })
set("n", "<leader>uw", "guiw", { desc = "Lower case for current word" })
set("n", "<leader>Up", "gUip", { desc = "Upper case for current paragraph" })
set("n", "<leader>up", "guip", { desc = "Lower case for current paragraph" })
set("n", "<leader>Ul", "gUU", { desc = "Upper case for current line" })
set("n", "<leader>ul", "guu", { desc = "Lower case for current line" })

-- Buffers
set("n", "<C-b>", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Move around
set("n", "<M-l>", "zL", { desc = "Move right" })
set("n", "<M-h>", "zH", { desc = "Move left" })
set("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })
set("n", "<M-j>", "<C-d>zz", { desc = "Move down and center" })
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-left>", "<cmd>bp<CR>", { desc = "Jump to previous buffer" })
set("n", "<C-right>", "<cmd>bn<CR>", { desc = "Jump to next buffer" })
set("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })
set("n", "<M-k>", "<C-u>zz", { desc = "Move up and center" })
set("n", "M-j", "j^", { desc = "Goto to the beginning of the next line" })
set("n", "M-up", "k^", { desc = "Goto to the beginning of the previous line" })
set("n", "<leader>j", ":cprev<CR>", { desc = "cprev" })
set("n", "<leader>k", ":cnext<CR>", { desc = "cnext" })

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
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
-- MiniComment.toggle_lines(line_start, line_end, opts)
-- Split windows
set("n", "<leader>we", "<C-w>=", { desc = "Distribute windows equally" })
set("n", "<leader>wh", "<C-w>s", { desc = "Create horizontal split" })
set("n", "<leader>wv", "<C-w>v", { desc = "Create verical split" })
set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current window" })
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Deactivate cursor keys
set("n", "<down>", '<cmd>echo "Use j!"<CR>', { desc = "How about no?" })
set("n", "<up>", '<cmd>echo "Use k!"<CR>', { desc = "How about no?" })
set("n", "<left>", '<cmd>echo "Use h!"<CR>', { desc = "How about no?" })
set("n", "<right>", '<cmd>echo "Use l!"<CR>', { desc = "How about no?" })
set("n", "<ScrollWheelUp>", '<cmd>echo "Use the keyboard!"<CR>', { desc = "How about no?" })
set("n", "<ScrollWheelDown>", '<cmd>echo "Use the keyboard!"<CR>', { desc = "How about no?" })

-- Formatting
set("n", "<leader>f", function()
	vim.lsp.buf.format()
end, { desc = "Format Buffer" })
