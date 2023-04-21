return {
  "mrjones2014/smart-splits.nvim", -- better than lazies resize (left is really left in right split)
  { "Pocco81/auto-save.nvim", cmd = "ASToggle" },
  "axiros/vpe",
  "godlygeek/tabular",
  "junegunn/limelight.vim",
  "mbbill/undotree",
  -- kshenoy/vim-signature
  {
    "simrat39/symbols-outline.nvim", -- the symbols split window
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = true,
  },

  -- add telescope-fzf-native: Faster + supports e.g. 'foo
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
}
