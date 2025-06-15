return {
  ----------------------------------- colorthemes
  "rose-pine/neovim",
  "sainnhe/sonokai",
  "sainnhe/everforest",
  "arcticicestudio/nord-vim",
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = true },
  "cocopon/iceberg.vim",
  "cormacrelf/vim-colors-github",
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        -- use the night style
        style = "moon",
        -- disable italic for functions
        -- Change the "hint" color to the "orange" color, and make the "error" color bright red
        on_colors = function(colors)
          colors.hint = "#555555"
          colors.warning = "#555555"
          colors.error = "#555555"
        end,
      })
    end,
  },
  "ramojus/mellifluous.nvim",
  "yazeed1s/oh-lucy.nvim",
  "dracula/vim",
  "joshdick/onedark.vim",
  "matsuuu/pinkmare",
  --'AlexvZyl/nordic.nvim',
  "AXGKl/nordic.nvim",
  "rebelot/kanagawa.nvim",
  "alligator/accent.vim",
  {
    "barrientosvctor/abyss.nvim",
    lazy = true,
    priority = 1000,
  },
}
