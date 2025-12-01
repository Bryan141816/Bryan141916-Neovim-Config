return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim" },
	lazy = false,
	priority = 1000,
	config = function()
		require("neo-tree").setup({
			filesystem = { filtered_items = { hide_dotfiles = false, hide_gitignored = false } },
			close_if_last_window = true,
		})
	end,
}
