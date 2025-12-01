return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "html", "javascript", "typescript", "tsx", "vue" },
			highlight = { enable = true },
			rainbow = { enable = true, extended_mode = true },
			incremental_selection = { enable = true },
			auto_install = false,
		})
	end,
}
