-- define common options
local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

-- Hint: see `:h vim.map.set()`
-- Better window navigation
vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-----------------
-- Visual mode --
-----------------
-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })

vim.keymap.set({"v", "s"}, "<Up>", "k", { noremap = true, silent = true })
vim.keymap.set({"v", "s"}, "<Down>", "j", { noremap = true, silent = true })
vim.keymap.set({"v", "s"}, "<Left>", "h", { noremap = true, silent = true })
vim.keymap.set({"v", "s"}, "<Right>", "l", { noremap = true, silent = true })


-- Save file with Ctrl+S in normal mode
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })

-- Optional: also save in insert mode
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true, silent = true })

-- Optional: also save in visual mode
vim.keymap.set("v", "<C-s>", "<Esc>:w<CR>gv", { noremap = true, silent = true })


-- Undo Ctrl-z
vim.keymap.set("n", "<C-z>", ":u<CR>", { noremap = true, silent = true })
vim.keymap.set("i", "<C-z>", "<Esc>:u<CR>a", { noremap = true, silent = true })
vim.keymap.set("v", "<C-z>", "<Esc>:w<CR>gv", { noremap = true, silent = true })


-- Redo Ctrl-r
-- Normal mode

-- Insert mode
vim.keymap.set("i", "<C-r>", "<Esc><C-r>a", { noremap = true, silent = true })

-- Visual mode
vim.keymap.set("v", "<C-r>", "<Esc><C-r>gv", { noremap = true, silent = true })

-- Open LazyGit in a floating terminal
vim.keymap.set("n", "<leader>gg", function()
    -- Create a new scratch buffer for terminal
    local buf = vim.api.nvim_create_buf(false, true)

    -- Calculate floating window dimensions
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local row = math.floor((vim.o.lines - height) / 2)
    local col = math.floor((vim.o.columns - width) / 2)

    -- Open floating window
    local win = vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
    })

    -- Start LazyGit in the terminal
    vim.fn.termopen("lazygit")

    -- Enter insert mode for terminal input
    vim.cmd("startinsert")

    -- Map 'q' to close this floating window (local to buffer)
    vim.api.nvim_buf_set_keymap(buf, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(buf, "n", "<Esc>", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(buf, "n", "<C-c>", "<cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(buf, "t", "q", "<C-\\><C-n><cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<C-\\><C-n><cmd>close<CR>", { noremap = true, silent = true })
    vim.api.nvim_buf_set_keymap(buf, "t", "<C-c>", "<C-\\><C-n><cmd>close<CR>", { noremap = true, silent = true })
end, { noremap = true, silent = true })


