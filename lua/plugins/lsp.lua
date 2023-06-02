-- since this is just an example spec, don't actually load anything here and return an empty spec
-- -- xstylua: ignore

return {
  -- add pyright to lspconfig
  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      autoformat = false, -- we use ,w to format and write. can't reformat other peoples code on small changes
      -- ---@type lspconfig.options
      servers = {
        marksman = {
          --root_dir = require("lspconfig.util").root_pattern({ ".git" }),
        },
      },
    },
    -- root_dir = function(startpath)
    --   vim.notify(startpath)
    --   return nil
    --   --return require("lspconfig.util").root_pattern("asdfgit")(startpath)
    --   -- local d = require("lspconfig.util").root_pattern(".git")
    -- end,
    -- all to get our para-jumps with J and K, which we need e.g. for markdown presenations:
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "K", false }
      keys[#keys + 1] = { " k", vim.lsp.buf.hover, desc = "Hover" } -- you can leave spc pressed while hitting k. it's ok.
      table.insert(keys, { ",x", require("user.utils").toggle_diag_displ, desc = "Toggle Diag Displ" })
    end,
  },
  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      opts.indent = { enable = true, disable = { "python" } }
      opts.highlight = { enable = true, disable = { "sh", "bash" } }
      vim.list_extend(opts.ensure_installed, {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      })
    end,
  },

  -- add jsonls and schemastore ans setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- add any tools you want to have installed below
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "bash-language-server",
        "blue",
        "flake8",
        "marksman",
        "pyright",
        "shellcheck",
        "shfmt",
        "stylua",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "mason.nvim" },
    opts = function()
      local nls = require("null-ls")
      return {
        root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
        sources = {
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.shfmt.with({ extra_args = { "-i", "4", "-ci" } }), --ft must be sh - NOT bash
          nls.builtins.formatting.blue,
          -- nls.builtins.diagnostics.flake8,
        },
      }
    end,
  },
}
