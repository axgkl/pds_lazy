-- return {
--   'olimorris/codecompanion.nvim',
--   opts = {},
--   dependencies = {
--     'nvim-lua/plenary.nvim',
--     'nvim-treesitter/nvim-treesitter',
--   },
-- }
return {
  {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'hrsh7th/nvim-cmp',
      'nvim-telescope/telescope.nvim',
      { 'stevearc/dressing.nvim', opts = {} },
    },
    config = function()
      local api_keys = require('api_keys')
      -- Set the environment variable programmatically
      vim.env.ANTHROPIC_API_KEY = api_keys.anthropic
      
      require('codecompanion').setup({
        strategies = {
          chat = {
            adapter = 'anthropic',
          },
          inline = {
            adapter = 'anthropic',
          },
          agent = {
            adapter = 'anthropic',
          },
        },
        adapters = {
          anthropic = function()
            return require('codecompanion.adapters').use('anthropic', {
              env = {
                api_key = 'ANTHROPIC_API_KEY',
              },
            })
          end,
        },
      })
    end,
  },
}
