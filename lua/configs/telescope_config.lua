
return function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")

  telescope.setup{
    defaults = {
      prompt_prefix = "🔍 ",
      selection_caret = " ",
      path_display = { "truncate" },

      -- Layout settings
      layout_strategy = "horizontal",
      layout_config = {
        prompt_position = "top",
        preview_width = 0.55,  -- preview takes 55% of width
        width = 0.95,          -- total telescope width
        height = 0.85,         -- total telescope height
        mirror = false,        -- results on left, preview on right
      },
      sorting_strategy = "ascending",
      mappings = {
        i = {
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
        },
      },
    },
    pickers = {
      -- Remove dropdown theme to respect horizontal layout
      find_files = {},
      live_grep = {},
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
    },
  }

  -- Load fzf extension
  telescope.load_extension("fzf")

  -- Keymaps
  local map = vim.keymap.set
  map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
  map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
  map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
  map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
  map("n", "<leader>fo", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true })
end


