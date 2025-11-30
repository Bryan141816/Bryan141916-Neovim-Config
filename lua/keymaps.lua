-- define common options
local opts = {
	noremap = true, -- non-recursive
	silent = true, -- do not show message
}
vim.opt.timeoutlen = 500
-----------------
-- Normal mode --
-----------------

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- Visual mode --
-----------------
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

vim.keymap.set({ "v", "s" }, "<Up>", "k", { noremap = true, silent = true })
vim.keymap.set({ "v", "s" }, "<Down>", "j", { noremap = true, silent = true })
vim.keymap.set({ "v", "s" }, "<Left>", "h", { noremap = true, silent = true })
vim.keymap.set({ "v", "s" }, "<Right>", "l", { noremap = true, silent = true })

------------------
--Coding Keymap--
------------------

-- Save file with Ctrl+S in normal mode
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true }) --Normal mode keymap
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true }) --Insert mode keymap
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>gv", { noremap = true, silent = true }) --Visual mode keymap

-- Undo Ctrl-z
vim.keymap.set("n", "<C-z>", ":u<CR>", { noremap = true, silent = true }) --Normal mode keymap
vim.keymap.set("i", "<C-z>", "<Esc>:u<CR>a", { noremap = true, silent = true }) --Insert mode keymap
vim.keymap.set("v", "<C-z>", "<Esc>:w<CR>gv", { noremap = true, silent = true }) --Visual mode keymap

-- Redo Ctrl-r
vim.keymap.set("i", "<C-r>", "<Esc><C-r>a", { noremap = true, silent = true }) --Insert mode keymap
vim.keymap.set("v", "<C-r>", "<Esc><C-r>gv", { noremap = true, silent = true }) --Visual mode keymap

-- Shift-Arrow enter visual mode
vim.keymap.set("n", "<S-Up>", "v<Up>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Down>", "v<Down>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Left>", "v<Left>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Right>", "v<Right>", { noremap = true, silent = true })

-- Shift-Arrow enter visual mode (insert mode)
vim.keymap.set("i", "<S-Up>", "<Esc>v<Up>", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Down>", "<Esc>v<Down>", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Left>", "<Esc>v<Left>", { noremap = true, silent = true })
vim.keymap.set("i", "<S-Right>", "<Esc>v<Right>", { noremap = true, silent = true })

-- Move current line up
vim.keymap.set("n", "<A-Up>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

-- Move current line down
vim.keymap.set("n", "<A-Down>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)

-------------------
--Buffer Controls--
-------------------

-- Close all buffers

vim.keymap.set("n", "<leader>ba", function()
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
end, { noremap = true, silent = true })

-- Close all buffers except current and special ones like Neo-tree
vim.keymap.set("n", "<leader>bo", function()
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
end, { noremap = true, silent = true })

-- Close buffers to the left of current
vim.keymap.set("n", "<leader>bl", function()
	local current = vim.api.nvim_get_current_buf()
	local bufs = vim.api.nvim_list_bufs()

	for _, buf in ipairs(bufs) do
		if
			vim.api.nvim_buf_is_loaded(buf)
			and buf ~= current
			and vim.api.nvim_buf_get_option(buf, "buftype") == ""
			and vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
		then
			if buf < current then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end
	end
end, { noremap = true, silent = true })

-- Close buffers to the right of current
vim.keymap.set("n", "<leader>br", function()
	local current = vim.api.nvim_get_current_buf()
	local bufs = vim.api.nvim_list_bufs()

	for _, buf in ipairs(bufs) do
		if
			vim.api.nvim_buf_is_loaded(buf)
			and buf ~= current
			and vim.api.nvim_buf_get_option(buf, "buftype") == ""
			and vim.api.nvim_buf_get_option(buf, "filetype") ~= "neo-tree"
		then
			if buf > current then
				vim.api.nvim_buf_delete(buf, { force = true })
			end
		end
	end
end, { noremap = true, silent = true })

----------
--Others--
----------

-- Open LazyGit in a floating terminal
vim.keymap.set("n", "<leader>gg", function()
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

	--Keymaps for closing lazygit--
	vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf, "n", "<C-c>", "<cmd>close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf, "t", "q", "<C-\\><C-n><cmd>close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<C-\\><C-n><cmd>close<CR>", { noremap = true, silent = true })
	vim.api.nvim_buf_set_keymap(buf, "t", "<C-c>", "<C-\\><C-n><cmd>close<CR>", { noremap = true, silent = true })
end, { noremap = true, silent = true })

-- Open Posting in a floating terminal

vim.keymap.set("n", "<leader>pp", function()
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

	-- Properly attach terminal to the floating buffer
	vim.fn.termopen("posting")

	-- Go into insert mode in terminal
	vim.api.nvim_set_current_win(win)
	vim.cmd("startinsert")

	-- Close mappings
	local opts = { noremap = true, silent = true }
	local mappings = { "q", "<Esc>", "<C-c>" }
	for _, key in ipairs(mappings) do
		vim.api.nvim_buf_set_keymap(buf, "n", key, "<cmd>close<CR>", opts)
		vim.api.nvim_buf_set_keymap(buf, "t", key, "<C-\\><C-n><cmd>close<CR>", opts)
	end
end, { noremap = true, silent = true })
