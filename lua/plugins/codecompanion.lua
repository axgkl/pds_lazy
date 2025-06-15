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
      -- This automatically sets vim.env.ANTHROPIC_API_KEY
      require('api_keys')
      
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
        display = {
          action_palette = {
            width = 95,
            height = 10,
          },
        },
        prompt_library = require('codecompanion_prompts'),
      })
    end,
  },
}
