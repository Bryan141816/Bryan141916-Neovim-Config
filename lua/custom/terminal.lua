local M = {}

local Terminal = require("toggleterm.terminal").Terminal

-- Horizontal terminal
local horiz_term = Terminal:new({
	cmd = vim.o.shell,
	hidden = true,
	direction = "horizontal",
	close_on_exit = true,
})
function M.horiz_toggle()
	horiz_term:toggle()
end

-- Vertical terminal
local vert_term = Terminal:new({
	cmd = vim.o.shell,
	hidden = true,
	direction = "vertical",
	close_on_exit = true,
})
function M.vert_toggle()
	vert_term:toggle()
end

-- Floating terminal
local float_term = Terminal:new({
	cmd = vim.o.shell,
	hidden = true,
	direction = "float",
	close_on_exit = true,
})
function M.float_toggle()
	float_term:toggle()
end

return M
