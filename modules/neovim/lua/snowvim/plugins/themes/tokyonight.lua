require("tokyonight").setup {
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
