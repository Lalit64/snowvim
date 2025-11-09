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
  dep_of = {
    "lualine.nvim",
  },
  colorscheme = {
    "tokyonight",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    local _trans = false

    if require("nixCatsUtils").isNixCats then
      if nixCats.extra "colorscheme.name" == "tokyonight" then
        if nixCats.extra "colorscheme.style" == "light" then
          vim.o.background = "light"
        else
          vim.o.background = "dark"
        end
        if nixCats.extra "colorscheme.transparent" ~= nil then
          _trans = nixCats.extra "colorscheme.transparent"
        end
      end
    end

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
  end,
}
