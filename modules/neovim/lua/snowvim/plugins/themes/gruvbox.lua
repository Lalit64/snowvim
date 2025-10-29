-- Default options:
require("gruvbox").setup {
  transparent_mode = true,
  overrides = {
    TabLineFill = { bg = "none" },
    StatusLine = { bg = "none" },
    StatusLineNC = { bg = "none" },
  },
}
vim.cmd "colorscheme gruvbox"
