require("lze").load {
  {
    "nvim-notify",
    after = function(_)
      require("notify").setup {
        render = "compact",
        background_colour = "#000000",
        fps = 120,
      }
    end,
  },
  {
    "noice.nvim",
    event = { "DeferredUIEnter" },
    load = function(name)
      require("lzextras").loaders.multi {
        name,
        "nui.nvim",
        "nvim-notify",
      }
    end,
    after = function(_)
      require("noice").setup {
        lsp = {
          progress = { enabled = true },
          hover = { enabled = true },
          signature = { enabled = true },
        },
        presets = {
          bottom_search = false,
          command_palette = true,
          long_message_to_split = false,
          lsp_doc_border = true,
        },
        notify = { enabled = true },
        messages = { enabled = true },
      }
    end,
  },
}

-- NOTE: Disable deprecation warnings for vim.tbl_islist
local original_deprecate = vim.deprecate

vim.deprecate = function(msg, ...)
  if msg:find "vim.tbl_islist" then
    return
  end
  original_deprecate(msg, ...)
end
