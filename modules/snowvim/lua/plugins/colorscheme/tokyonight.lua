return {
  "tokyonight.nvim",
  for_cat = {
    cat = "theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "tokyonight",
  },
  colorscheme = {
    "tokyonight-day",
    "tokyonight-moon",
    "tokyonight-night",
    "tokyonight-storm",
    "tokyonight",
  },
  after = function(plugin)
    -- Load us
    require("tokyonight").setup {
      style = "moon",
      transparent = true,
      on_highlights = function(hl, c)
        hl.TabLineFill = {
          bg = c.none,
        }
      end,
      on_colors = function(colors)
        colors.bg_statusline = colors.none
      end,
      styles = {
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
      },
      plugins = {
        all = true,
      },
    }
  end,
}
