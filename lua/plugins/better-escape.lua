return {
  'max397574/better-escape.nvim',
  config = function()
    --  jk also in caps lock mode
    require('better_escape').setup({ default_mappings = true, mappings = { i = { J = { K = '<Esc>' } } } })
  end,
}
