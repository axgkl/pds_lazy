return {
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    lazy = true,
    build = "cd app && npm install && git reset --hard",
  },
  { "mikeboiko/vim-markdown-folding", ft = "markdown" }, -- better than TS
  { "preservim/vim-markdown", ft = "markdown" },
}
