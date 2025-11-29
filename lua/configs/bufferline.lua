return function()
    vim.opt.termguicolors = true
    vim.o.showtabline = 2

    require('bufferline').setup{
      highlights = {
            buffer_selected = {
                italic = false,
            },
      },
      options = {
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        show_buffer_close_icons = true,
        show_close_icon = false,
        separator_style = "slant",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Explorer",
            highlight = "Directory",
            text_align = "left"
          }
        },
      },
    }

    -- Keymaps to switch buffers
    vim.keymap.set('n', '<Tab>', ':BufferLineCycleNext<CR>', { silent = true })
    vim.keymap.set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { silent = true })

    vim.keymap.set('n', '<C-x>', ':bdelete<CR>', { silent = true })
end

