-- Default to tokyonight moon
local _theme = {
  base00 = "#1d2021", -- ----
  base01 = "#3c3836", -- ---
  base02 = "#504945", -- --
  base03 = "#665c54", -- -
  base04 = "#bdae93", -- +
  base05 = "#d5c4a1", -- ++
  base06 = "#ebdbb2", -- +++
  base07 = "#fbf1c7", -- ++++
  base08 = "#fb4934", -- red
  base09 = "#fe8019", -- orange
  base0A = "#fabd2f", -- yellow
  base0B = "#b8bb26", -- green
  base0C = "#8ec07c", -- aqua/cyan
  base0D = "#83a598", -- blue
  base0E = "#d3869b", -- purple
  base0F = "#d65d0e", -- brown
}

local _trans = false

-- The stylix base16 array should be provided in the extra.colorscheme.base16 array
if require("nixCatsUtils").isNixCats then
  if nixCats.extra "colorscheme.base16" ~= nil then
    _theme = nixCats.extra "colorscheme.base16"
  end
  if nixCats.extra "colorscheme.transparent" ~= nil then
    _trans = nixCats.extra "colorscheme.transparent"
  end
end

-- Load the colorscheme
require("mini.base16").setup {
  palette = _theme,
  plugins = {
    default = true,
  },
}
