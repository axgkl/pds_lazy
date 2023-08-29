return {
  "goolord/alpha-nvim",
  opts = function(_, opts)
    -- customize the dashboard header
    opts.section.header.val = {
      "                  ◢ ▨ ▨ ◣         ◢ ▨ ▨ ▨ ◤        Z",
      "                ◢ ▨ ▨ ▨ ▨ ◣     ◢ ▨ ▨ ▨ ◤     Z",
      "              ◢ ▨ ▨ ▨ ▨ ▨ ▨ ◣ ◢ ▨ ▨ ▨ ◤   z",
      "            ◢ ▨ ▨ ▨ ◤ ◥ ▨ ▨ ▨ ▨ ▨ ▨ ◤   ",
      "          ◢ ▨ ▨ ▨ ◤     ◥ ▨ ▨ ▨ ▨ ◤    ",
      "        ◢ ▨ ▨ ▨ ◤       ◢ ▨ ▨ ▨ ▨ ◣       ",
      "      ◢ ▨ ▨ ▨ ◤       ◢ ▨ ▨ ▨ ▨ ▨ ▨ ◣      ",
      "    ◢ ▨ ▨ ▨ ◤       ◢ ▨ ▨ ▨ ◤ ◥ ▨ ▨ ▨ ◣    ",
      "  ◢ ▨ ▨ ▨ ◤       ◢ ▨ ▨ ▨ ◤     ◥ ▨ ▨ ▨ ◣  ",
      "◢ ▨ ▨ ▨ ◤       ◢ ▨ ▨ ▨ ◤         ◥ ▨ ▨ ▨ ◣  ",
      "",
      "Type Alt-H for README",
    }
    local dashboard = require("alpha.themes.dashboard")
    dashboard.section.buttons.val[6] =
      dashboard.button("s", " " .. " Restore Session", [[:SessionManager! load_session<cr>]])
    return opts
  end,
}
