require("nvim-treesitter.configs").setup({
	ensure_installed = { "typescript", "javascript", "lua", "python" },
	highlight = { enable = true },
	rainbow = { enable = true, extended_mode = true },
	incremental_selection = { enable = true },
	auto_install = false, -- let Mason manage installations
})
