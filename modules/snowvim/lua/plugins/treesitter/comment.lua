return {
  "nvim-ts-context-commentstring",
  dep_of = "comment.nvim",
  after = function(_)
    require("ts_context_commentstring").setup {
      enable_autocmd = false,
    }
  end,
}, {
  "mini.comment",
  after = function(_)
    require("mini.comment").setup {
      hook = {
        pre = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      },
    }
  end,
}
