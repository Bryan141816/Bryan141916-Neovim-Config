if vim.fn.has("win32") == 1 then
  vim.o.shell = "pwsh"           
  vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
  vim.o.shellquote = ""
  vim.o.shellxquote = ""
end

vim.o.termguicolors = true

vim.o.scrolloff = 5      
vim.o.sidescrolloff = 5  
vim.o.scrolljump = 1
vim.o.startofline = false
vim.o.wrap = false       -- optional, avoids weird horizontal jumps

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require('options')
require('keymaps')
require('plugins')
require('lsp')
require('configs.treesitter')
