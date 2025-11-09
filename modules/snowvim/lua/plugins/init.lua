---@diagnostic disable-next-line: duplicate-set-field
package.preload["nvim-web-devicons"] = function()
  require("mini.icons").mock_nvim_web_devicons()
  return package.loaded["nvim-web-devicons"]
end

require("lze").load {
  -- completion
  { import = "plugins.completion.blink" },

  { import = "plugins.completion.luasnip" },

  -- snacks
  { import = "plugins.snacks" },

  -- colorscheme
  { import = "plugins.colorscheme.minitheme" }, -- use for stylix
  { import = "plugins.colorscheme.gruvbox" },
  { import = "plugins.colorscheme.tokyonight" },

  -- treesitter
  { import = "plugins.treesitter" },
  { import = "plugins.treesitter.comment" },

  -- ui
  { import = "plugins.ui.bufferline" },
  { import = "plugins.ui.lualine" },
  { import = "plugins.ui.gitsigns" },
  { import = "plugins.ui.noice" },
  { import = "plugins.ui.which-key" },
  { import = "plugins.ui.nvim-tree" },

  -- lsp
  { import = "plugins.lsp.lsp" },
  { import = "plugins.lsp.lazydev" },
  { import = "plugins.lsp.conform" },
  { import = "plugins.lsp.lint" },

  -- misc
  { import = "plugins.misc" },
}
