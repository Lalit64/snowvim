return {
  "gitsigns.nvim",
  event = { "DeferredUIEnter" },
  after = function(_)
    require("gitsigns").setup {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        delay = 0,
      },
    }
  end,
}
