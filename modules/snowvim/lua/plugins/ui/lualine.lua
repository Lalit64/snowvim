return {
  "lualine.nvim",
  event = { "DeferredUIEnter" },
  load = function(name)
    require("lzextras").loaders.multi {
      name,
    }
  end,
  after = function(_)
    local status_ok, lualine = pcall(require, "lualine")
    if not status_ok then
      return
    end

    lualine.setup {
      options = {
        icons_enabled = true,
        globalstatus = true,
        theme = "auto",
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "snacks_dashboard", "NvimTree" },
      },
      sections = {
        lualine_a = {
          { "mode", icon = "" },
        },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
            padding = { left = 1, right = 0 },
          },
          "filename",
        },
        lualine_c = {
          {
            "branch",
            icon = "",
          },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            colored = false,
          },
        },
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", hint = " ", info = " " },
            update_in_insert = true,
          },
        },
        lualine_y = { clients_lsp },
        lualine_z = {
          { "location", icon = "" },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
    }
  end,
}
