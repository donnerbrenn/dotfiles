return {
	"timtro/glslView-nvim",
	ft = "glsl",
	config = function()
		require("glslView").setup({
			options = {
				viewer_path = "glslView",
				args = { "-l" },
			},
		})
	end,
}
