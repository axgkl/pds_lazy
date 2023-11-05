return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        css = { "prettierd", "prettier" },
        toml = { "taplo" },
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "ruff_format", "ruff_fix" },
        -- Use a sub-list to run only the first available formatter
        javascript = { { "prettierd", "prettier" } },
      },
    },
  },
}
