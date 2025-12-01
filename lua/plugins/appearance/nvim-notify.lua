return {
	"rcarriga/nvim-notify",
	config = function()
		local notify = require("notify")

		notify.setup({
			stages = "fade_in_slide_out",
			render = "wrapped-default",
			timeout = 2000,
			fps = 60,
			top_down = false,
		})
		vim.notify = notify
	end,
}
