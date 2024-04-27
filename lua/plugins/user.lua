return {
  'mrjones2014/smart-splits.nvim', -- better than lazies resize (left is really left in right split)

  { 'echasnovski/mini.pairs', enabled = false },

  'axiros/vpe',
  'godlygeek/tabular',
  'junegunn/limelight.vim',
  'mbbill/undotree',
  'tpope/vim-surround',
  'brentyi/isort.vim',
  'isobit/vim-caddyfile',
  'nvim-zh/better-escape.vim',
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup() -- attach to all filetypes
    end,
  },
  {

    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-emoji' },
    opts = function(_, opts)
      table.insert(opts.sources, { name = 'emoji' })
      table.insert(opts.sources, { name = 'copilot', group_index = 2 })
    end,
  },
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        --'js-debug-adapter',
        'shfmt',
      },
    },
  },
  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    'nvim-treesitter/nvim-treesitter',
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        'bash',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'markdown_inline',
        'mermaid',
        'python',
        'query',
        'regex',
        --"tsx",
        --"typescript",
        'vim',
        'yaml',
      })
    end,
  },
}
