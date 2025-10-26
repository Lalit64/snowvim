local M = {}

M.picker = {
  opts = {
    picker = {
      enabled = true,
      prompt = "  ",
      focus = "input",
      layout = {
        cycle = true,
        --- Use the default layout or vertical if the window is too narrow
        preset = function()
          return vim.o.columns >= 120 and "default" or "vertical"
        end,
      },
      matcher = {
        fuzzy = true,
      },
      ui_select = true,
    },
  },
}

return M
