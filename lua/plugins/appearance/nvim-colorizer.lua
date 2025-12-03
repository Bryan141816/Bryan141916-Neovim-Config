return {
	"NvChad/nvim-colorizer.lua",
	config = function()
		require("colorizer").setup({
			filetypes = { "*" },
			user_commands = true,
			lazy_load = true,
			user_default_options = {
				names = true,
				RGB = true,
				RRGGBB = true,
				mode = "virtualtext",
				virtualtext = "■",
				virtualtext_inline = false,
				virtualtext_mode = "foreground",
				virtualtext_inline = "before",
				tailwind = true,
			},
		})
	end,
}
