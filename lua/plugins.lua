local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "uloco/bluloco.nvim",
        lazy = false,
        priority = 1000,
        dependencies = { "rktjmp/lush.nvim" },
        config = function()
            require("bluloco").setup({
                style = "dark",       -- "dark" or "light"
                transparent = false,  -- true to remove background
            })
            vim.cmd("colorscheme bluloco")

            -- Hide the tildes at the end of buffer
            vim.opt.fillchars:append("eob: ")
        end,
    },
    {
        "saghen/blink.cmp",
        dependencies = {"rafamadriz/friendly-snippets"},

        version = "*",
        opts = {
            keymap = {
                preset = "enter",

                ["<Up>"] = { "select_prev", "fallback" },
                ["<Down>"] = { "select_next", "fallback"},
                ["<Tab>"] = { "select_next", "fallback"},
                ["<S-Tab>"] = { "select_prev", "fallback"},

                ["<C-b>"] = { "scroll_documentation_up", "fallback" },
                ["<C-f>"] = { "scroll_documentation_down", "fallback" },

                ["<C-k>"] = { "show_signature", "hide_signature", "fallback"},

            },
            appearance = {
                nerd_font_variant = "mono",
            },

            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" },
            completion = {
                keyword = { range = "prefix" },
                menu = {
                    draw = {
                        treesitter = { "lsp" },
                    },
                },
                trigger = { show_on_trigger_character = true },
                documentation = {
                    auto_show = true,
                },
            },

            signature = { enabled = true },
        },
        opts_extend = { "sources.default" },
    },
    { "mason-org/mason.nvim", opts={} },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        config = function()
            require('nvim-treesitter.configs').setup({
                ensure_installed = { "html", "javascript", "typescript", "tsx", "vue" },
                highlight = { enable = true },
                autotag = { enable = true },  -- 🔑 enable autotag here
            })
        end
    },

    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = { 
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      lazy = false,  -- make sure it loads at startup
      priority = 1000,
      config = function()
        require("neo-tree").setup({
          filesystem = {
            filtered_items = {
              hide_dotfiles = false,
              hide_gitignored = false,
            }
          }
        })

        -- Keymap: Ctrl + n to toggle
        vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { noremap = true, silent = true })
        vim.keymap.set("i", "<C-n>", "<Esc>:Neotree toggle<CR>a", { noremap = true, silent = true })
        vim.keymap.set("s", "<C-n>", "<Esc>:Neotree toggle<CR>gv", { noremap = true, silent = true })

        -- Optional: reveal current file with <leader>r
        vim.keymap.set("n", "<leader>r", ":Neotree reveal<CR>", { noremap = true, silent = true })
      end
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = require('configs.lualine_bubbles'), 
    },

    {
      "folke/trouble.nvim",
      opts = {}, -- for default options, refer to the configuration section for custom setup.
      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
    {
      'akinsho/bufferline.nvim',
      version = "*",
      dependencies = 'nvim-tree/nvim-web-devicons',
      config = require('configs.bufferline')    
    },
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = require('configs/toggleterm_toggles'),
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim", -- optional, faster sorting
      },
      build = "make",
      config = require('configs/telescope_config'),
    },
    {
      "numToStr/Comment.nvim",
      config = function()
        require('Comment').setup({
          toggler = {
            line = '<leader>/',
          },
          opleader = { 
            line = '<leader>/',
          },
        })
      end,
    },
    {
        "windwp/nvim-autopairs",
        config = function()
            require('nvim-autopairs').setup({
                check_ts = true,  -- use Treesitter to detect pairs in code
                fast_wrap = {},
            })
        end
    },
    {
        "kylechui/nvim-surround",
        version = "*", -- Use latest stable
    },
    {
        "windwp/nvim-ts-autotag",
        ft = { "html", "javascript", "typescriptreact", "javascriptreact", "vue" }, -- lazy-load for these filetypes
        dependencies = "nvim-treesitter/nvim-treesitter",
        config = function()
            require('nvim-ts-autotag').setup({
                filetypes = { "html", "javascript", "typescriptreact", "javascriptreact", "vue" },
                skip_tags = { "area", "base", "br", "col", "embed", "hr", "img", "input", "link", "meta", "param", "source", "track", "wbr" },
            })
        end,
    },
     {
    "brenoprata10/nvim-highlight-colors",
    config = function()      
        require("nvim-highlight-colors").setup({
            render = 'virtual',
            virtual_symbol = '■',
            enable_tailwind = true,
        })
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local cw = require("codewindow")
      cw.setup({
        -- your config options here if needed
      })

      -- keymap to toggle minimap
      vim.keymap.set("n", "<leader>mm", function()
        cw.toggle_minimap()
      end, { noremap = true, silent = true, desc = "Toggle Codewindow Minimap" })
    end,
  },
  {
    "3rd/image.nvim",
    config = function()
        require("image").setup({
            render = {
                min_padding = 5,  -- padding around image
                show_label = false,
            },
        })
    end,
    ft = {"png", "jpg", "jpeg", "bmp", "gif"}, -- only load for image filetypes
}

})
