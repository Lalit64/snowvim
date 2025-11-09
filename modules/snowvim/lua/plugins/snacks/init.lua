-- <nixCats>/lua/pluginConf/snacks/init.lua
-- Snacks configuration entry point

-- Configuring various snack components
return {
  "snacks.nvim",
  lazy = false,
  after = function(plugin)
    local snacks = require "snacks"

    require("snacks").setup {
      styles = {
        float = { wo = { winblend = 0 } },
        lazygit = {
          border = "rounded",
          backdrop = false,
        },
        git = { backdrop = false },
      },
      bigfile = { enabled = true },
      gitbrowse = { enabled = true },
      lazygit = {
        enabled = true,
        win = { position = "float" },
      },
      quickfile = { enabled = false },
      dashboard = require "plugins.snacks.dashboard",
      picker = require "plugins.snacks.picker",
      rename = { enabled = true },
      image = {
        enabled = true,
        doc = { inline = false, float = true },
      },
      indent = {
        enabled = true,
      },
      scroll = {
        enabled = true,
        animate = {
          duration = { step = 20, total = 200 },
          easing = "linear",
        },
      },
      statuscolumn = {
        enabled = false,
        left = { "mark", "sign" },
        right = { "fold", "git" },
        folds = { open = true, git_hl = true },
      },
    }
  end,
}
