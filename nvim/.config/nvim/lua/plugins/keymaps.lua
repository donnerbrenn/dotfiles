local set = vim.keymap.set
return {
	-- -- Mason
	set("n", "<leader>mm", "<cmd>Mason<CR>", { desc = "Mason " }),
	set("n", "<leader>mu", "<cmd>MasonUpdate<CR>", { desc = "Mason update" }),
	-- Lazy
	set("n", "<leader>ll", "<cmd>Lazy<CR>", { desc = "Go to Lazy" }),
	set("n", "<leader>lu", "<cmd>Lazy update<CR>", { desc = "Lazy update" }),
	-- Comments
	-- set("n", "<leader>/", "<cmd>CommentToggle<CR>", { desc = "Toggle comment" }),
	-- set("v", "<leader>/", "<cmd>CommentToggle<CR>", { desc = "Toggle comment" }),
	-- vim.keymap.set("n", "/", _G.comment_line, { expr = true, replace_keycodes = false }),
}
