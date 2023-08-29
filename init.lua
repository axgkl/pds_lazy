-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

P = function(v)
  print(vim.inspect(v))
  return v
end

