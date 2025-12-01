return {
	"akinsho/toggleterm.nvim",
	version = "*",

	config = function()
		require("toggleterm").setup({
			size = 20,
			open_mapping = [[<C-\>]],
			start_in_insert = true,
			shade_terminals = true,
			shading_factor = 2,
		})

		-- Load module so Terminal:new() works
		require("custom.terminal")
	end,
}
