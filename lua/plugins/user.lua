return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      --"echasnovski/mini.icons",
      'nvim-tree/nvim-web-devicons',
    },
    ft = 'markdown',
    opts = { heading = {}, code = {} },
  },
  ----------------------------------- colorthemes
  'rose-pine/neovim',
  'sainnhe/sonokai',
  'sainnhe/everforest',
  'arcticicestudio/nord-vim',
  { 'catppuccin/nvim', name = 'catppuccin', priority = 1000, lazy = false },
  'cocopon/iceberg.vim',
  'cormacrelf/vim-colors-github',
  'folke/tokyonight.nvim',
  'ramojus/mellifluous.nvim',
  'yazeed1s/oh-lucy.nvim',
  'dracula/vim',
  'joshdick/onedark.vim',
  'matsuuu/pinkmare',
  --'AlexvZyl/nordic.nvim',
  'AXGKl/nordic.nvim',
  'rebelot/kanagawa.nvim',
  'alligator/accent.vim',
  {
    'barrientosvctor/abyss.nvim',
    lazy = true,
    priority = 1000,
  },
  { 'lmburns/kimbox', lazy = true, priority = 1000 },
  ----------------------------------- end colorthemes

  'mrjones2014/smart-splits.nvim', -- better than lazies resize (left is really left in right split)
  'vim-crystal/vim-crystal', -- ruby but fast
  { 'echasnovski/mini.pairs', enabled = false },

  'axiros/vpe',
  'godlygeek/tabular',
  --'junegunn/limelight.vim',
  'mbbill/undotree',
  'tpope/vim-surround',
  'brentyi/isort.vim',
  'isobit/vim-caddyfile',
  'nvim-zh/better-escape.vim',
  --'liuchengxu/vista.vim',
  {

    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-emoji' },
    opts = function(_, opts)
      table.insert(opts.sources, { name = 'emoji' })
      table.insert(opts.sources, { name = 'copilot', group_index = 2 })
    end,
  },
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>T",
        function() require("telescope.builtin").builtin() end,
        desc = "List all Telescope Builtins",
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
  -- change some telescope options and a keymap to browse plugin files
  {
    'nvim-telescope/telescope.nvim',
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find nvim plugin file",
      },
    },
  },
  {
    'LazyVim/LazyVim',
    opts = {
      --colorscheme = 'catppuccin',
      --colorscheme = 'catppuccin-latte',
      --colorscheme = 'abyss',
      --colorscheme = 'tokyonight-night',
      colorscheme = 'nordic',
    },
  },
  -- add any tools you want to have installed below
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'stylua',
        'shellcheck',
        'shfmt',
      },
    },
  },
}
