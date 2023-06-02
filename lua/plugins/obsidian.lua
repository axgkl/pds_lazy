local d_vault = os.getenv("OBS_VAULT") or vim.fn.expand("~/notes")

local options = {
  dir = d_vault,
  -- Optional, if you keep notes in a specific subdirectory of your vault.
  --notes_subdir = "notes",
  daily_notes = {
    folder = "notes/dailies",
  },
  completion = {
    nvim_cmp = false,
  },
  note_id_func = function(title)
    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
    -- In this case a note with the title 'My new note' will given an ID that looks
    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
    local suffix = ""
    if title ~= nil then
      -- If title is given, transform it into valid file name.
      suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
    else
      -- If title is nil, just add 4 random uppercase letters to the suffix.
      for _ = 1, 4 do
        suffix = suffix .. string.char(math.random(65, 90))
      end
    end
    return tostring(os.time()) .. "-" .. suffix
  end,
  -- Optional, set to true if you don't want Obsidian to manage frontmatter.
  disable_frontmatter = false,
  -- Optional, alternatively you can customize the frontmatter data.
  note_frontmatter_func = function(note)
    -- This is equivalent to the default frontmatter function.
    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    -- `note.metadata` contains any manually added fields in the frontmatter.
    -- So here we just make sure those fields are kept in the frontmatter.
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
      for k, v in pairs(note.metadata) do
        out[k] = v
      end
    end
    return out
  end,
  -- Optional, for templates (see below).
  templates = {
    subdir = "templates",
    date_format = "%Y-%m-%d-%a",
    time_format = "%H:%M",
  },
  -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
  -- URL it will be ignored but you can customize this behavior here.
  follow_url_func = function(url)
    -- Open the URL in the default web browser.
    vim.fn.jobstart({ "open", url }) -- Mac OS
    -- vim.fn.jobstart({"xdg-open", url})  -- linux
  end,
  -- Optional, set to true if you use the Obsidian Advanced URI plugin.
  -- https://github.com/Vinzent03/obsidian-advanced-uri
  use_advanced_uri = true,
  -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
  open_app_foreground = false,
}

return {
  "epwalsh/obsidian.nvim",
  lazy = true,
  event = { "BufReadPre " .. d_vault .. "/**.md" },
  -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
  -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- Optional, for completion.
    "hrsh7th/nvim-cmp",

    -- Optional, for search and quick-switch functionality.
    "nvim-telescope/telescope.nvim",

    -- Optional, an alternative to telescope for search and quick-switch functionality.
    -- "ibhagwan/fzf-lua"
    -- Optional, alternative to nvim-treesitter for syntax highlighting.
    "godlygeek/tabular",
    "preservim/vim-markdown",
  },
  opts = options,
  config = function(_, opts)
    require("user.utils").toggle_diag_displ("off")
    require("obsidian").setup(opts)

    -- Optional, override the 'gf' keymap to utilize Obsidian's search functionality.
    -- see also: 'follow_url_func' config option above.
    vim.keymap.set("n", "<CR>", function()
      if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
      else
        return "<CR>"
      end
    end, { noremap = false, expr = true })
  end,
  init = function()
    local lazy_setup = function()
      -- Configure completion...
      -- Add source.
      local cmp = require("cmp")
      local sources = {
        { name = "obsidian",     option = options },
        { name = "obsidian_new", option = options },
      }
      for _, source in pairs(cmp.get_config().sources) do
        if source.name ~= "obsidian" and source.name ~= "obsidian_new" and source.name ~= "nvim_lsp" then
          table.insert(sources, source)
        end
      end
      cmp.setup.buffer({ sources = sources })
    end

    -- Autocommands...
    --vim.api.nvim_del_augroup_by_name("obsidian_setup")
    local group = vim.api.nvim_create_augroup("obsidian_setup2", { clear = true })

    -- Complete lazy setup on BufEnter
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
      group = group,
      pattern = d_vault .. "/**.md",
      callback = lazy_setup,
    })
  end,
}
