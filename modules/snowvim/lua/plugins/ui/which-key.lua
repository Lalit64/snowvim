return {
  "which-key.nvim",
  for_cat = {
    cat = "status",
    default = true,
  },
  lazy = false,
  after = function(plugin)
    require("which-key").setup {
      preset = "modern",
      icons = {
        mappings = false,
      },
      spec = {
        { "<leader>f", group = "[F]ind" },
        { "<leader>c", group = "[C]ode" },
        { "<leader>l", group = "[L]azy" },
        { "<leader>r", group = "[R]e..." },
      },
    }
  end,
}
