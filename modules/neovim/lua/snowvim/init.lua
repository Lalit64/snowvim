require("snowvim.opts").initial()

-- NOTE: Register another one from lzextras. This one makes it so that
-- you can set up lsps within lze specs,
-- and trigger lspconfig setup hooks only on the correct filetypes
require("lze").register_handlers(require("lzextras").lsp)

require "snowvim.plugins"
require "snowvim.plugins.bars"
require "snowvim.plugins.completions"
require "snowvim.plugins.git"
require "snowvim.plugins.ui"
require "snowvim.plugins.keymaps"
require "snowvim.plugins.lsps"
require "snowvim.plugins.themes"
require "snowvim.plugins.treesitter"

require("snowvim.opts").final()
