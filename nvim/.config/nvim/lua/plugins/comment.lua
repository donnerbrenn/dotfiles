return {
	"terrortylor/nvim-comment",
	config = function()
		-- require("nvim_comment").setup({ create_mappings = false })
		require("nvim_comment").setup({
			comment_chunk_text_object = "i/",
		})
	end,
}
