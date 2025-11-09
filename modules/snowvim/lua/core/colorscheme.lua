local cs = ""
local _trans = false

if not require("nixCatsUtils").isNixCats then
  cs = "retrobox"
else
  cs = nixCats.extra "colorscheme.name"
  transparent = nixCats.extra "colorscheme.transparent"

  if (cs == "") or (cs == nil) or not cs then
    cs = "default"
  end
end

vim.cmd.colorscheme(cs)

local colors = require "mini.colors"

if require("nixCatsUtils").isNixCats then
  if nixCats.extra "colorscheme.transparent" ~= nil then
    _trans = nixCats.extra "colorscheme.transparent"

    if _trans then
      colors
        .get_colorscheme()
        :add_transparency({
          general = true,
          float = true,
          statuscolumn = true,
          statusline = true,
          tabline = true,
          winbar = true,
        })
        :apply()
    end
  end
end
