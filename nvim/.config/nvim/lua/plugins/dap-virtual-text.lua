-- plugins/nvim-dap-virtual-text.lua
return {
	"theHamsta/nvim-dap-virtual-text",
	opts = {
		enabled = true,
		highlight_changed_variables = true,
		show_stop_reason = true,
		virt_text_pos = "eol",
		all_frames = true,
	},
}
