function dap_config()
  local ok, dap = pcall(require, 'dap')
  if not ok then
    return
  end
  dap.configurations.typescript = {
    {
      type = 'node2',
      name = 'node attach',
      request = 'attach',
      program = '${file}',
      port = 3882,
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
    },
  }
  dap.configurations.javascript = dap.configurations.typescript
  local mason_path = '/home/gk/.local/share/nvim/mason/' --vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

  dap.adapters.node2 = {
    type = 'executable',
    command = 'node',
    args = { mason_path .. 'packages/node-debug2-adapter/out/src/nodeDebug.js' },
  }
end

dap_config()

--
-- local dap = require('dap')
--
-- dap.adapters['pwa-node'] = {
--   type = 'server',
--   host = '127.0.0.1',
--   port = 3882,
--   executable = {
--     command = 'js-debug-adapter',
--   },
-- }
--
-- for _, language in ipairs({ 'typescript', 'javascript' }) do
--   dap.configurations[language] = {
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch file',
--       program = '/home/gk/repos/ax/devapps/lc-wifi/bin/hubdebug',
--       cwd = '/home/gk/micromamba/envs/lc-wifi_py3.11/lib/python3.11/site-packages/node_red/js/nodered', --${workspaceFolder}',
--       runtimeExecutable = 'node',
--     },
--   }
-- end
