-- package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?/init.lua'
-- package.path = package.path .. ';' .. vim.fn.expand('$HOME') .. '/.luarocks/share/lua/5.1/?.lua'
if true then
  return {
    'axiros/vpe',
    'mrjones2014/smart-splits.nvim', -- better than lazies resize (left is really left in right split)
    'godlygeek/tabular',
    --'junegunn/limelight.vim',
    'mbbill/undotree',
    --'tpope/vim-surround',
    'brentyi/isort.vim',
    'isobit/vim-caddyfile',
    'liuchengxu/vista.vim',
    { 'echasnovski/mini.pairs', enabled = false },
    {
      -- taskrunner
      'stevearc/overseer.nvim',
      config = function()
        require('overseer').setup({
          -- add your overseer config here
        })
      end,
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      -- install the latest stable version
      version = '*',
      config = function()
        require('telescope').load_extension('frecency')
      end,
    },
    {
      'nvim-telescope/telescope.nvim',
      keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        '<leader>T',
        function() require('telescope.builtin').builtin() end,
        desc = 'List all Telescope Builtins',
      },
      },
    },

    {
      'nvim-telescope/telescope.nvim',
      keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        '<leader>fp',
        function() require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root }) end,
        desc = 'Find nvim plugin file',
      },
      },
    },
    {
      'LazyVim/LazyVim',
      opts = {
        --colorscheme = 'catppuccin',
        --colorscheme = 'catppuccin-latte',
        --colorscheme = 'abyss',
        colorscheme = 'tokyonight-night',
        --colorscheme = 'nordic',
      },
    },
    -- add any tools you want to have installed below
  }
end

-- {
--       'hrsh7th/nvim-cmp',
--       dependencies = { 'hrsh7th/cmp-emoji' },
--       ---@param opts cmp.ConfigSchema
--       opts = function(_, opts)
--         table.insert(opts.sources, { name = 'emoji' })
--       end,
--     },

-- {
--   'pimalaya/himalaya-vim',
--   config = function()
--     vim.g.himalaya_executable = '~/.local/bin/himalaya-fix.sh'
--     --vim.g.himalaya_folder_picker = 'fzf'
--   end,
-- },
--    -- {
--   'CopilotC-Nvim/CopilotChat.nvim',
--   dependencies = {
--     { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
--     { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
--   },
--   build = 'make tiktoken', -- Only on MacOS or Linux
--   opts = {
--     -- See Configuration section for options
--   },
--   -- See Commands section for default commands if you want to lazy load on them
-- },
-- {
--   'nvim-neo-tree/neo-tree.nvim',
--   config = function()
--     require('neo-tree').setup({
--       event_handlers = {
--         {
--           event = 'file_open_requested',
--           handler = function()
--             require('neo-tree.command').execute({ action = 'close' })
--           end,
--         },
--       },
--     })
--   end,
-- },
-- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
-- treesitter, mason and typescript.nvim. So instead of the above, you can use:
-- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
-- would overwrite `ensure_installed` with the new value.
-- If you'd rather extend the default config, use the code below instead:
-- change some telescope options and a keymap to browse plugin files
--
--
-- every spec file under the 'plugins' directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
-- return {
--   -- add gruvbox
--   { 'ellisonleao/gruvbox.nvim' },
--
--   -- Configure LazyVim to load gruvbox
--   {
--     'LazyVim/LazyVim',
--     opts = {
--       colorscheme = 'gruvbox',
--     },
--   },
--
--   -- change trouble config
--   {
--     'folke/trouble.nvim',
--     -- opts will be merged with the parent spec
--     opts = { use_diagnostic_signs = true },
--   },
--
--   -- disable trouble
--   { 'folke/trouble.nvim', enabled = false },
--
--   -- override nvim-cmp and add cmp-emoji
--   {
--     'hrsh7th/nvim-cmp',
--     dependencies = { 'hrsh7th/cmp-emoji' },
--     ---@param opts cmp.ConfigSchema
--     opts = function(_, opts)
--       table.insert(opts.sources, { name = 'emoji' })
--     end,
--   },
--
--   -- change some telescope options and a keymap to browse plugin files
--   {
--     'nvim-telescope/telescope.nvim',
--     keys = {
--       -- add a keymap to browse plugin files
--       -- stylua: ignore
--       {
--         '<leader>fp',
--         function() require('telescope.builtin').find_files({ cwd = require('lazy.core.config').options.root }) end,
--         desc = 'Find Plugin File',
--       },
--     },
--     -- change some options
--     opts = {
--       defaults = {
--         layout_strategy = 'horizontal',
--         layout_config = { prompt_position = 'top' },
--         sorting_strategy = 'ascending',
--         winblend = 0,
--       },
--     },
--   },
--
--   -- add pyright to lspconfig
--   {
--     'neovim/nvim-lspconfig',
--     ---@class PluginLspOpts
--     opts = {
--       ---@type lspconfig.options
--       servers = {
--         -- pyright will be automatically installed with mason and loaded with lspconfig
--         pyright = {},
--       },
--     },
--   },
--
--   -- add tsserver and setup with typescript.nvim instead of lspconfig
--   {
--     'neovim/nvim-lspconfig',
--     dependencies = {
--       'jose-elias-alvarez/typescript.nvim',
--       init = function()
--         require('lazyvim.util').lsp.on_attach(function(_, buffer)
--           -- stylua: ignore
--           vim.keymap.set( 'n', '<leader>co', 'TypescriptOrganizeImports', { buffer = buffer, desc = 'Organize Imports' })
--           vim.keymap.set('n', '<leader>cR', 'TypescriptRenameFile', { desc = 'Rename File', buffer = buffer })
--         end)
--       end,
--     },
--     ---@class PluginLspOpts
--     opts = {
--       ---@type lspconfig.options
--       servers = {
--         -- tsserver will be automatically installed with mason and loaded with lspconfig
--         tsserver = {},
--       },
--       -- you can do any additional lsp server setup here
--       -- return true if you don't want this server to be setup with lspconfig
--       ---@type table<string, fun(server:string, opts:_.lspconfig.options):boolean?>
--       setup = {
--         -- example to setup with typescript.nvim
--         tsserver = function(_, opts)
--           require('typescript').setup({ server = opts })
--           return true
--         end,
--         -- Specify * to use this function as a fallback for any server
--         -- ['*'] = function(server, opts) end,
--       },
--     },
--   },
--
--   -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
--   -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
--   { import = 'lazyvim.plugins.extras.lang.typescript' },
--
--   -- add more treesitter parsers
--   {
--     'nvim-treesitter/nvim-treesitter',
--     opts = {
--       ensure_installed = {
--         'bash',
--         'html',
--         'javascript',
--         'json',
--         'lua',
--         'markdown',
--         'markdown_inline',
--         'python',
--         'query',
--         'regex',
--         'tsx',
--         'typescript',
--         'vim',
--         'yaml',
--       },
--     },
--   },
--
--   -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
--   -- would overwrite `ensure_installed` with the new value.
--   -- If you'd rather extend the default config, use the code below instead:
--   {
--     'nvim-treesitter/nvim-treesitter',
--     opts = function(_, opts)
--       -- add tsx and treesitter
--       vim.list_extend(opts.ensure_installed, {
--         'tsx',
--         'typescript',
--       })
--     end,
--   },
--
--   -- the opts function can also be used to change the default opts:
--   {
--     'nvim-lualine/lualine.nvim',
--     event = 'VeryLazy',
--     opts = function(_, opts)
--       table.insert(opts.sections.lualine_x, {
--         function()
--           return '😄'
--         end,
--       })
--     end,
--   },
--
--   -- or you can return new options to override all the defaults
--   {
--     'nvim-lualine/lualine.nvim',
--     event = 'VeryLazy',
--     opts = function()
--       return {
--         --[[add your custom lualine config here]]
--       }
--     end,
--   },
--
--   -- use mini.starter instead of alpha
--   { import = 'lazyvim.plugins.extras.ui.mini-starter' },
--
--   -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
--   { import = 'lazyvim.plugins.extras.lang.json' },
--
--   -- add any tools you want to have installed below
--   {
--     'williamboman/mason.nvim',
--     opts = {
--       ensure_installed = {
--         'stylua',
--         'shellcheck',
--         'shfmt',
--         'flake8',
--       },
--     },
--   },
-- }
