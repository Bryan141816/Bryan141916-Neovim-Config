
{ 
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      -- optional settings, e.g. compile, styles, theme variant, etc.
      compile = false,
      -- theme = "wave",   -- default is "wave"
      -- or theme = "dragon", "lotus"
    })
    vim.cmd("colorscheme kanagawa")
  end,
}

