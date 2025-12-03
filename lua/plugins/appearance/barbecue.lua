return {
	"utilyre/barbecue.nvim",
	name = "barbecue",
	version = "*",
	dependencies = {
		"SmiteshP/nvim-navic",
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		attach_navic = true, -- attach LSP breadcrumbs
		show_dirname = true, -- optional, shows directory
		show_basename = true, -- shows file name
		show_modified = true, -- shows modified indicator
		theme = "auto", -- or set a static color theme
		-- Add a debounce for updates to reduce lag
		update_events = { "CursorHold", "BufEnter", "BufWinEnter" },
	},
	config = function(_, opts)
		-- Automatically disable for large files
		if vim.api.nvim_buf_line_count(0) > 2000 then
			opts.attach_navic = false
		end
		require("barbecue").setup(opts)
	end,
}
