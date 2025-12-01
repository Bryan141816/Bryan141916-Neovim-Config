return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		local wk = require("which-key")
		wk.setup({
			-- Only trigger which-key for <leader> and <A-...> keys
			triggers = {
				"<leader>",
			},
		})
		wk.add({
			{ "<leader>b", group = "Buffer Controls" },
			{ "<leader>f", group = "Telescope" },
		})
	end,
}
