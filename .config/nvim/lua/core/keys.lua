vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
local keymap = vim.keymap -- for conciseness()

keymap.set('n', '<F9>', '<cmd>:w<CR><cmd>!make clean gen/shaders.h<CR>', { desc = 'Build shaders' })

-- Alpha
keymap.set('n', '<leader>aa', ':Alpha<CR>', { desc = 'Toggle Alpha' })

--Config
keymap.set('n', '<leader>R', ':so %<CR>', { desc = 'Reload config' })

--Sorting
keymap.set('v', '<leader>ss', ':sort<CR>', { desc = 'Sort lines' })
keymap.set('v', '<leader>si', ':sort i<CR>', { desc = 'Sort lines, ignore case' })
keymap.set('v', '<leader>su', ':sort u<CR>', { desc = 'Sort lines and deduplicate' })

-- Buffers
keymap.set('n', '<C-b>', '<cmd>bd<CR>', { desc = 'Close current buffer' })

-- Move around
keymap.set('n', 'M-j', 'j^', { desc = 'Goto to the beginning of the next line' })
keymap.set('n', 'M-up', 'k^', { desc = 'Goto to the beginning of the previos line' })
keymap.set('n', '<C-left>', '<cmd>bnext<CR>', { desc = 'Jump to next buffer' })
keymap.set('n', '<C-right>', '<cmd>bprevious<CR>', { desc = 'Jump to previous buffer' })
keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Move down and center' })

keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Move up and center' })
-- Move stuff around
keymap.set('n', '<C-up>', '<cmd>m -2<CR>', { desc = 'Move line up' })
keymap.set('n', '<C-down>', '<cmd>m +1<CR>', { desc = 'Move line down' })

-- Comments
keymap.set('n', '<S-M-i>', 'gcc', { desc = '(un)comment line' })

-- Bools
keymap.set('n', '<M-t>', 'ciwtrue<ESC>', { desc = 'Remove word under the cursor and write "true"' })
keymap.set('n', '<S-M-t>', 'ciwTrue<ESC>', { desc = 'Remove word under the cursor and write "True"' })
keymap.set('n', '<M-f>', 'ciwfalse<ESC>', { desc = 'Remove word under the cursor and write "false"' })
keymap.set('n', '<S-M-f>', 'ciwFalse<ESC>', { desc = 'Remove word under the cursor and write "False"' })

-- Lazy
keymap.set('n', '<leader>ll', '<cmd>Lazy<CR>', { desc = 'Go to Lazy' })
keymap.set('n', '<leader>lu', '<cmd>Lazy update<CR>', { desc = 'Lazy update' })

-- Mason
keymap.set('n', '<leader>mu', '<cmd>MasonUpdate<CR>', { desc = 'Mason update' })
keymap.set('n', '<leader>mm', '<cmd>Mason<CR>', { desc = 'Mason ' })

-- Line numbers
keymap.set('n', '<leader>n', '<cmd>set nu!<CR>', { desc = 'Switch line numbers' })
keymap.set('n', '<leader>t', '<cmd>set rnu!<CR>', { desc = 'Switch relative line numbers' })

-- Highlighting
keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostics
keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })

-- Split windows
keymap.set('n', '<leader>sv', '<C-w>v')
keymap.set('n', '<leader>sh', '<C-w>s')
keymap.set('n', '<leader>se', '<C-w>=')
keymap.set('n', '<leader>sx', '<cmd>close<CR>')
