return {
  {
    "plenary.nvim",
  },
  {
    "render-markdown.nvim",
  },
  {
    "tabout.nvim",
    event = { "DeferredUIEnter" },
    after = function(_)
      require("tabout").setup {}
    end,
  },
  {
    "blink.pairs",
    event = { "DeferredUIEnter" },
    after = function(_)
      require("blink.pairs").setup {}
    end,
  },
  {
    "mini.surround",
    event = { "DeferredUIEnter" },
    after = function(_)
      require("mini.surround").setup {}
    end,
  },
}
