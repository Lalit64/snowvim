return {
  "gruvbox.nvim",
  for_cat = {
    cat = "theme",
    default = true,
  },
  in_extra = {
    key = "colorscheme.name",
    value = "gruvbox",
  },
  dep_of = {
    "lualine.nvim",
  },
  colorscheme = {
    "gruvbox",
  },
  event = { "DeferredUIEnter" },
  after = function(plugin)
    local _trans = false

    if require("nixCatsUtils").isNixCats then
      if nixCats.extra "colorscheme.name" == "gruvbox" then
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

    require("gruvbox").setup {
      transparent_mode = _trans,
      terminal_colors = true,
      overrides = {
        TabLineFill = { bg = "none" },
        StatusLine = { bg = "none" },
        StatusLineNC = { bg = "none" },
      },
    }
  end,
}
