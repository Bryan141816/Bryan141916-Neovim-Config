-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
local map = vim.keymap.set

-- Better window navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- Visual mode --
-----------------

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<Space>", "<Nop>", opts)

map({ "v", "s" }, "<Up>", "k", opts)
map({ "v", "s" }, "<Down>", "j", opts)
map({ "v", "s" }, "<Left>", "h", opts)
map({ "v", "s" }, "<Right>", "l", opts)

------------------
-- Coding Keymap --
------------------

map("n", "<C-s>", ":w<CR>", opts)
map("i", "<C-s>", "<Esc>:w<CR>a", opts)
map("v", "<C-s>", "<Esc>:w<CR>gv", opts)

map("n", "<C-z>", ":u<CR>", opts)
map("i", "<C-z>", "<Esc>:u<CR>a", opts)
map("v", "<C-z>", ":u<CR>gv", opts)

map("i", "<C-r>", "<Esc><C-r>a", opts)
map("v", "<C-r>", "<Esc><C-r>gv", opts)

-- Shift + Arrow enter visual mode
map("n", "<S-Up>", "v<Up>", opts)
map("n", "<S-Down>", "v<Down>", opts)
map("n", "<S-Left>", "v<Left>", opts)
map("n", "<S-Right>", "v<Right>", opts)

map("i", "<S-Up>", "<Esc>v<Up>", opts)
map("i", "<S-Down>", "<Esc>v<Down>", opts)
map("i", "<S-Left>", "<Esc>v<Left>", opts)
map("i", "<S-Right>", "<Esc>v<Right>", opts)

-- Move lines
map("n", "<A-Up>", ":m .-2<CR>==", opts)
map("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)
map("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
map("n", "<A-Down>", ":m .+1<CR>==", opts)
map("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
map("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)

-------------------
-- Buffer Controls --
-------------------

local buffers = require("custom.buffers")

map("n", "<Tab>", ":BufferLineCycleNext<CR>", { silent = true })

map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { silent = true })

map("n", "<C-x>", buffers.safe_bdelete, { silent = true })

map("n", "<leader>ba", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if
			vim.api.nvim_buf_is_loaded(buf)
			and vim.api.nvim_buf_get_option(buf, "buftype") == ""
			and vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
		then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "Close all buffers." })

map("n", "<leader>bo", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if
			vim.api.nvim_buf_is_loaded(buf)
			and buf ~= current
			and vim.api.nvim_buf_get_option(buf, "buftype") == ""
			and vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
		then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "Close other buffers." })

map("n", "<leader>bl", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if
			vim.api.nvim_buf_is_loaded(buf)
			and buf < current
			and vim.api.nvim_buf_get_option(buf, "buftype") == ""
			and vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
		then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "Close buffers to the left." })

map("n", "<leader>br", function()
	local current = vim.api.nvim_get_current_buf()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if
			vim.api.nvim_buf_is_loaded(buf)
			and buf > current
			and vim.api.nvim_buf_get_option(buf, "buftype") == ""
			and vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
		then
			vim.api.nvim_buf_delete(buf, { force = true })
		end
	end
end, { desc = "Close buffers to the right." })

-------------
--Telescope--
-------------

map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", {
	noremap = true,
	silent = true,
	desc = "Find files",
})

map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", {
	noremap = true,
	silent = true,
	desc = "Search text (live grep)",
})

map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", {
	noremap = true,
	silent = true,
	desc = "List buffers",
})

map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", {
	noremap = true,
	silent = true,
	desc = "Help tags",
})

map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", {
	noremap = true,
	silent = true,
	desc = "Recent files",
})

-----------
--Neo Tree--
------------

map("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
map("i", "<C-n>", "<Esc>:Neotree toggle<CR>a", { noremap = true, silent = true })
map("s", "<C-n>", "<Esc>:Neotree toggle<CR>gv", { noremap = true, silent = true })
map("n", "<leader>r", ":Neotree reveal<CR>", { noremap = true, silent = true, desc = "Open NeoTree" })

------------
--Terminal--
------------

local term = require("custom.terminal")

map("n", "<A-h>", term.horiz_toggle, { noremap = true, silent = true })
map("n", "<A-v>", term.vert_toggle, { noremap = true, silent = true })
map("n", "<A-f>", term.float_toggle, { noremap = true, silent = true })

----------
-- Others --
----------

map("n", "<leader>gg", function()
	local buf = vim.api.nvim_create_buf(false, true)

	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.fn.termopen("lazygit")
	vim.cmd("startinsert")

	map("n", "q", "<cmd>close<CR>", { buffer = buf })
	map("n", "<Esc>", "<cmd>close<CR>", { buffer = buf })
	map("n", "<C-c>", "<cmd>close<CR>", { buffer = buf })
	map("t", "q", "<C-\\><C-n><cmd>close<CR>", { buffer = buf })
	map("t", "<Esc>", "<C-\\><C-n><cmd>close<CR>", { buffer = buf })
	map("t", "<C-c>", "<C-\\><C-n><cmd>close<CR>", { buffer = buf })
end, { desc = "Open LazyGit." })

map("n", "<leader>pp", function()
	local buf = vim.api.nvim_create_buf(false, true)

	local width = math.floor(vim.o.columns * 0.8)
	local height = math.floor(vim.o.lines * 0.8)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	local win = vim.api.nvim_open_win(buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
	})

	vim.fn.termopen("posting")
	vim.api.nvim_set_current_win(win)
	vim.cmd("startinsert")

	local close_keys = { "q", "<Esc>", "<C-c>" }
	for _, key in ipairs(close_keys) do
		map("n", key, "<cmd>close<CR>", { buffer = buf, silent = true })
		map("t", key, "<C-\\><C-n><cmd>close<CR>", { buffer = buf, silent = true })
	end
end, { desc = "Open Posting." })

map("n", "<leader>mm", function()
	cw.toggle_minimap()
end, { noremap = true, silent = true, desc = "Toggle Codewindow Minimap" })
