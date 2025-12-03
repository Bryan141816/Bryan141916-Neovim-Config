-- Windows-specific shell configuration
if vim.fn.has("win32") == 1 then
	vim.o.shell = "pwsh"
	vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
	vim.o.shellquote = ""
	vim.o.shellxquote = ""
end

-- General settings
vim.o.termguicolors = true
vim.o.scrolloff = 5
vim.o.sidescrolloff = 5
vim.o.scrolljump = 1
vim.o.startofline = false
vim.o.wrap = false

-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Clipboard and completion
vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.mouse = "a"

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- UI configuration
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.showmode = false

-- Searching
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Diagnostics
vim.diagnostic.config({
	virtual_text = true,
	signs = false,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

-- Autoformat on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		require("conform").format({ async = false })
	end,
})
vim.api.nvim_create_user_command("BQ", function()
	local win = vim.api.nvim_get_current_win()
	local buf = vim.api.nvim_win_get_buf(win)
	local name = vim.api.nvim_buf_get_name(buf)
	local ft = vim.api.nvim_buf_get_option(buf, "filetype")
	local bt = vim.api.nvim_buf_get_option(buf, "buftype")
	local modified = vim.api.nvim_buf_get_option(buf, "modified")

	if ft == "neo-tree" then
		vim.cmd("close")
		return
	end

	if modified then
		vim.notify("Buffer has unsaved changes! Save or discard first.", vim.log.levels.WARN)
		return
	end

	-- Safe close without messing layout
	vim.cmd("bdelete!")
end, { bang = true })

vim.cmd([[
cnoreabbrev <expr> q getcmdtype() == ':' && getcmdline() == 'q' ? 'BQ' : 'q'
]])

vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local buf = vim.api.nvim_get_current_buf()
		local line = vim.api.nvim_buf_get_lines(buf, 0, 1, false)[1] -- first line
		if line and #line > 1000 then -- if line is longer than 10k chars
			-- Disable expensive things
			vim.opt_local.wrap = false -- no wrapping
			vim.opt_local.cursorline = false -- don’t highlight cursor line
			vim.opt_local.foldmethod = "manual"
			vim.opt_local.syntax = "off"
			vim.opt_local.conceallevel = 0
			vim.opt_local.lazyredraw = true
			print("Long line detected, features disabled")
		end
	end,
})
