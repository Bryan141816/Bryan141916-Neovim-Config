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
vim.opt.hlsearch = false
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
