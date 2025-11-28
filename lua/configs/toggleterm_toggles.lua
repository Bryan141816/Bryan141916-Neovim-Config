return function()
    local toggleterm = require("toggleterm")
    local Terminal  = require("toggleterm.terminal").Terminal

    -- Default setup
    toggleterm.setup{
      size = 20,
      open_mapping = [[<C-\>]], -- default toggle for a general terminal
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      persist_size = true,
      close_on_exit = true,
      shell = vim.o.shell,
    }

    -- Horizontal terminal
    local horiz_term = Terminal:new{
      cmd = vim.o.shell,
      hidden = true,
      direction = "horizontal",
      close_on_exit = true,
    }
    function _HORIZ_TOGGLE()
      horiz_term:toggle()
    end
    vim.keymap.set("n", "<A-h>", _HORIZ_TOGGLE, { noremap = true, silent = true })

    -- Vertical terminal
    local vert_term = Terminal:new{
      cmd = vim.o.shell,
      hidden = true,
      direction = "vertical",
      close_on_exit = true,
    }
    function _VERT_TOGGLE()
      vert_term:toggle()
    end
    vim.keymap.set("n", "<A-v>", _VERT_TOGGLE, { noremap = true, silent = true })

    -- Floating terminal
    local float_term = Terminal:new{
      cmd = vim.o.shell,
      hidden = true,
      direction = "float",
      close_on_exit = true,
    }
    function _FLOAT_TOGGLE()
      float_term:toggle()
    end
    vim.keymap.set("n", "<A-f>", _FLOAT_TOGGLE, { noremap = true, silent = true })

    vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], { noremap = true, silent = true })
end
