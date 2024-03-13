return {
  -- add gruvbox
  "ellisonleao/gruvbox.nvim",
  "sainnhe/gruvbox-material",
  "sainnhe/sonokai",
  "sainnhe/everforest",
  "arcticicestudio/nord-vim",
  "cocopon/iceberg.vim",
  "cormacrelf/vim-colors-github",
  "ellisonleao/gruvbox.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = 'night', transparent = false }
  },
  "ramojus/mellifluous.nvim",
  "yazeed1s/oh-lucy.nvim",
  "dracula/vim",
  "joshdick/onedark.vim",
  "matsuuu/pinkmare",
  "rebelot/kanagawa.nvim",
  "alligator/accent.vim",
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = {
      --https://rosepinetheme.com/palette/ingredients/
      disable_background = false,
      groups = { error = "pine" },
    },
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
