return {
  'MeanderingProgrammer/render-markdown.nvim',
  --dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    render_modes = { 'n', 'c', 't' }, -- not in insert mode
    completions = { blink = { enabled = true } },
    file_types = { 'markdown' },
    win_options = {
      -- @see :h 'conceallevel'
      conceallevel = {
        -- Used when not being rendered, get user setting.
        --default = vim.o.conceallevel,
        default = 0, -- this makes all be shown in insert mode
        -- Used when being rendered, concealed text is completely hidden.
        rendered = 3,
      },
      -- @see :h 'concealcursor'
      concealcursor = {
        -- Used when not being rendered, get user setting.
        default = vim.o.concealcursor,
        -- Used when being rendered, show concealed text in all modes.
        rendered = '',
      },
    },
    on = {
      -- Called when plugin initially attaches to a buffer.
      attach = function() end,
      -- Called before adding marks to the buffer for the first time.
      initial = function() end,
      -- Called after plugin renders a buffer.
      render = function() end,
      -- Called after plugin clears a buffer.
      clear = function() end,
    },
  },
}

-- { --disable the header non symbols and the code formatting from lazy
--       "MeanderingProgrammer/render-markdown.nvim",
--       dependencies = {
--         "nvim-treesitter/nvim-treesitter",
--         "echasnovski/mini.icons",
--         --"nvim-tree/nvim-web-devicons",
--       },
--       ---@module 'render-markdown'
--       ---@type 'render.md.UserConfig'
--       --opts = { heading = {}, code = {}, latex = { enabled = false } },
--       opts = { render_modes = { "n", "c", "t" } },
--       --ft = "markdown",
--     }
