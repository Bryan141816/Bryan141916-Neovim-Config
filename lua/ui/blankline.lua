local M = {}

function M.setup()
	-- Custom highlight for scope
	vim.cmd([[
      highlight IblScope guifg=#7D7D7D gui=nocombine
    ]])

	require("ibl").setup({
		indent = {
			char = "▏", -- thin vertical line
			highlight = { "IblIndent" },
		},
		scope = {
			enabled = true,
			show_start = true,
			show_end = true,
			highlight = "IblScope",
			-- remove include_current
		},
	})
end

return M
