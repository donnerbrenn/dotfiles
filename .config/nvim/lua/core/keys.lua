vim.g.mapleader = " "
vim.g.maplocalleader = " "
local set = vim.keymap.set
set("n", "<F9>", "<cmd>:w<CR><cmd>!make clean gen/shaders.h<CR>", { desc = "Build shaders" })

-- Alpha
set("n", "<leader>aa", ":Alpha<CR>", { desc = "Toggle Alpha" })

--Config
set("n", "<leader>R", ":so %<CR>", { desc = "Reload config" })

--Sorting
set("v", "<leader>si", ":sort i<CR>", { desc = "Sort lines, ignore case" })
set("v", "<leader>ss", ":sort<CR>", { desc = "Sort lines" })
set("v", "<leader>su", ":sort u<CR>", { desc = "Sort lines and deduplicate" })

-- Buffers
set("n", "<C-b>", "<cmd>bd<CR>", { desc = "Close current buffer" })

-- Move around
set("n", "<C-d>", "<C-d>zz", { desc = "Move down and center" })
set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
set("n", "<C-left>", "<cmd>bnext<CR>", { desc = "Jump to next buffer" })
set("n", "<C-right>", "<cmd>bprevious<CR>", { desc = "Jump to previous buffer" })
set("n", "<C-u>", "<C-u>zz", { desc = "Move up and center" })
set("n", "M-j", "j^", { desc = "Goto to the beginning of the next line" })
set("n", "M-up", "k^", { desc = "Goto to the beginning of the previous line" })

-- Move stuff around
set("n", "<C-down>", "<cmd>m +1<CR>", { desc = "Move line down" })
set("n", "<C-up>", "<cmd>m -2<CR>", { desc = "Move line up" })

-- Bools
set("n", "<M-f>", "ciwfalse<ESC>", { desc = 'Remove word under the cursor and write "false"' })
set("n", "<M-t>", "ciwtrue<ESC>", { desc = 'Remove word under the cursor and write "true"' })
set("n", "<S-M-f>", "ciwFalse<ESC>", { desc = 'Remove word under the cursor and write "False"' })
set("n", "<S-M-t>", "ciwTrue<ESC>", { desc = 'Remove word under the cursor and write "True"' })

-- Lazy
set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Go to Lazy" })
set("n", "<leader>lu", "<cmd>Lazy update<CR>", { desc = "Lazy update" })

-- Mason
set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason " })
set("n", "<leader>mu", "<cmd>MasonUpdate<CR>", { desc = "Mason update" })

-- Line numbers
set("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Switch line numbers" })
set("n", "<leader>t", "<cmd>set rnu!<CR>", { desc = "Switch relative line numbers" })

-- Highlighting
set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostics
set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })

-- Split windows
set("n", "<leader>se", "<C-w>=", { desc = "Distribute windows equally" })
set("n", "<leader>sh", "<C-w>s", { desc = "Create horizontal split" })
set("n", "<leader>sv", "<C-w>v", { desc = "Create verical split" })
set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current window" })
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-t>", "<C-W>+")
set("n", "<M-s>", "<C-W>-")

-- Deactivate cursor keys
set("n", "<down>", '<cmd>echo "use j"<CR>', { desc = "How about no?" })
set("n", "<up>", '<cmd>echo "use k"<CR>', { desc = "How about no?" })
set("n", "<left>", '<cmd>echo "use h"<CR>', { desc = "How about no?" })
set("n", "<right>", '<cmd>echo "use l"<CR>', { desc = "How about no?" })
