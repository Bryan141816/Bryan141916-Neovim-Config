return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		vim.opt.termguicolors = true
		vim.o.showtabline = 2

		require("bufferline").setup({
			highlights = {
				buffer_selected = {
					italic = false,
				},
			},
			options = {
				always_show_bufferline = true,
				diagnostics = "nvim_lsp",
				show_buffer_close_icons = true,
				show_close_icon = false,
				separator_style = "slant",
				offsets = {
					{
						filetype = "neo-tree",
						text = "Explorer",
						highlight = "Directory",
						text_align = "left",
					},
				},
				close_command = function(bufnum)
					require("custom.buffers").safe_bdelete(bufnum)
				end,
				right_mouse_command = function(bufnum)
					require("custom.buffers").safe_bdelete(bufnum)
				end,
			},
		})
	end,
}
