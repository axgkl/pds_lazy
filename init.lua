-- bootstrap lazy.nvim, LazyVim and your plugins
--

--vim.g.maplocalleader = ','
require('config.lazy')

--.setup("plugins", {

P = function(v)
  print(vim.inspect(v))
  return v
end
require('luasnip.loaders.from_snipmate').lazy_load({ paths = { '~/.config/nvim/snippets/snipmate' } })

ASGlobToggle = function()
  local as = require('autosave')
  local actions = require('autosave.actions')
  actions.global_toggle()
  local k = ''
  if as.enabled then
    k = '🟥'
  end
  vim.notify(k .. '  Global(!) autosave is ' .. tostring(as.enabled))
end

local actions = require('telescope.actions')
require('telescope').setup({
  defaults = { mappings = { i = {
    [',c'] = actions.close,
    [',q'] = actions.close,
  } } },
})
-- vim.lsp.set_log_level("debug")
vim.api.nvim_set_hl(0, 'DiagnosticHint', { fg = '#283D60', italic = true })
vim.api.nvim_set_hl(0, 'DiagnosticWarn', { fg = '#225588', italic = true })
vim.api.nvim_set_hl(0, 'String', { fg = '#839496', italic = true })
vim.api.nvim_set_hl(0, 'String', { fg = '#839496', italic = true })

vim.api.nvim_set_keymap('n', 'Z', '<Cmd>normal! <C-v><CR>', { noremap = true, silent = true })

-- vim.api.nvim_set_hl(0, 'Normal', { guibg = 'Red' })
-- vim.api.nvim_command('highlight Normal guibg=red')

--vim.api.nvim_set_hl(0, 'Function', { fg = '#93a1a1', italic = true })
-- vim.api.nvim_set_hl(0, 'Function', { fg = '#6c71c4', italic = false, bold = true })
-- vim.api.nvim_set_hl(0, 'NimTreeIndentMarkerxxx', { fg = '#6c71c4', italic = false, bold = true })
-- vim.api.nvim_set_hl(0, 'NimTreeIndentMarker', { fg = '#6c71c4', italic = false, bold = true })
-- --vim.api.nvim_set_hl(0, 'Class', { fg = '#93a1a1', italic = true })
--
-- vim.opt.termguicolors = false
