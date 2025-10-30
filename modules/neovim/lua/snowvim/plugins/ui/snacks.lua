require("lze").load {
  {
    "snacks.nvim",
    after = function(_)
      local snacks = require "snacks"
      local snacks_dashboard = require "snowvim.plugins.ui.snacks-dashboard"
      local snack_picker = require "snowvim.plugins.ui.snacks-picker"
      require "snowvim.plugins.ui.snacks-rename"

      snacks.setup {
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
        dashboard = snacks_dashboard.dashboard,
        picker = snack_picker.picker,
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
  },
}
