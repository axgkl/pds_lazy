return {
  {
    "L3MON4D3/LuaSnip",
    keys = function()
      return {}
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = { "InsertEnter" },
    dependencies = {
      "nvim-lspconfig",
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "uga-rosa/cmp-dictionary",
    },
    opts = {},
    config = function(_, _)
      local cmp = require("cmp")
      --local compare = require("cmp.config.compare")
      local lspkind = require("lspkind")

      -- Load custom github handles source from ./lua/cmp/github_handles.lua
      cmp.register_source("github_handles", require("cmp.github_handles").new())

      -- General setup.
      cmp.setup({
        -- snippet = {
        -- 	expand = function(args)
        -- 		vim.fn["vsnip#anonymous"](args.body)
        -- 	end,
        -- },
        matching = { disallow_fuzzy_matching = true },
        mapping = {
          ["<M-p>"] = cmp.mapping.select_prev_item(),
          ["<M-n>"] = cmp.mapping.select_next_item(),
          ["<S-n>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          --["<C-a>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-e>"] = cmp.mapping.close(),
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
          }),
        },
        sources = {
          { name = "nvim_lsp" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lua" },
          {
            name = "path",
            option = {
              get_cwd = function(_)
                return vim.fn.getcwd()
              end,
            },
          },
          { name = "emoji" },
          { name = "buffer",        keyword_length = 3 },
          { name = "calc" },
          { name = "dictionary",    priority = 0.1 },
          { name = "github_handles" }, -- from ./lua/cmp/github_handles.lua
          { name = "luasnip",       priority = 100 },
        },
        formatting = {
          fields = { "abbr", "kind", "menu" },
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 80,
            menu = {
              buffer = "[Buffer]",
              nvim_lsp = "[LSP]",
              obsidian = "[Obsidian]",
              obsidian_new = "[Obsidian]",
            },
          }),
        },
        -- python: try to keep dict also for python -> require dict sugg to be last:
        --sorting = { comparators = { compare.kind } },
        --
        -- sorting = {
        --   priority_weight = 2,
        --   comparators = {
        --     compare.exact,
        --     compare.offset,
        --     -- compare.scopes,
        --     compare.score,
        --     compare.recently_used,
        --     compare.locality,
        --     compare.kind,
        --     -- compare.sort_text,
        --     compare.length,
        --     compare.order,
        --   },
        -- },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
      -- Use buffer source for `/` searches:
      -- TODO:cannot tab through
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline", option = { ignore_cmds = { "Man", "!", "e", "edit" } } },
        }),
      })
      --
      --
      -- cmp.setup.filetype("markdown", {
      --   sources = cmp.config.sources({
      --     { name = "buffer", keyword_length = 3 },
      --     {
      --       name = "path",
      --       option = {
      --         get_cwd = function(_)
      --           return vim.fn.getcwd()
      --         end,
      --       },
      --     },
      --     { name = "calc" },
      --     { name = "emoji" },
      --     { name = "github_handles" },
      --     { name = "dictionary", keyword_length = 3 },
      --   }),
      -- })
      --

      local dict = require("cmp_dictionary")

      dict.setup({
        -- The following are default values.
        exact = 2,
        first_case_insensitive = false,
        document = false,
        document_command = "wn %s -over",
        async = false,
        sqlite = false,
        max_items = -1,
        capacity = 5,
        debug = false,
      })

      dict.switcher({
        -- filetype = {
        --   lua = "/path/to/lua.dict",
        --   javascript = { "/path/to/js.dict", "/path/to/js2.dict" },
        -- },
        -- filepath = {
        --   ["%.tmux.*%.conf"] = { "/path/to/js.dict", "/path/to/js2.dict" },
        -- },
        spelllang = {
          en = {
            vim.fs.normalize("~/.config/nvim/spell/en.utf-8.add"),
            vim.fs.normalize("~/.config/nvim/spell/10k.txt"),
          },
        },
      })
    end,
  },
}
