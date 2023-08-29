return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    transparent_background = false,
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.25, --
    },
    custom_highlights = {
      DiagnosticVirtualTextWarn = {
        fg = "#333333",
        --bg = C.none,
      },
      DiagnosticVirtualTextError = {
        fg = "#555555",
        --bg = C.none,
      },
    },
  },
  --
  -- config = function()
  --   Colors = require("catppuccin.palettes").get_palette("mocha")
  --   require("catppuccin").setup({
  --     custom_highlights = function(Colors)
  --       return {
  --         VertSplit = { fg = Colors.overlay0 },
  --       }
  --     end,
  --   })
  -- end,
}
