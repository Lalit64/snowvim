return {
  -- completion engines
  {
    "blink-ripgrep.nvim",
    for_cat = { cat = "completion.blink", default = true },
    on_plugin = { "blink.cmp" },
  },
  {
    "blink-cmp-spell",
    for_cat = { cat = "completion.blink", default = true },
    on_plugin = { "blink.cmp" },
  },
  -- main plugin
  {
    "blink.cmp",
    for_cat = { cat = "completion.blink", default = true },
    event = { "DeferredUIEnter" },
    on_require = { "blink" },
    after = function(plugin)
      local bl = require "blink.cmp"
      bl.setup {
        -- general completion settings
        completion = {
          keyword = { range = "full" },
          trigger = {
            show_on_keyword = true,
            show_on_trigger_character = true,
            show_on_insert_on_trigger_character = true,
          },
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
          accept = { auto_brackets = { enabled = false } },
          menu = {
            auto_show = true,
            border = "solid",
            scrollbar = false,
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
            treesitter_highlighting = false,
          },
          ghost_text = { enabled = true },
        },
        -- keymap
        keymap = {
          preset = "enter",
          ["<Up>"] = { "select_prev", "fallback_to_mappings" },
          ["<Down>"] = { "select_next", "fallback_to_mappings" },
          ["<Tab>"] = { "snippet_forward", "fallback" },
          ["<S-Tab>"] = { "snippet_backward", "fallback" },
        },
        -- completion sources
        sources = {
          default = function(ctx)
            -- default list of completion sources
            local sourceList = {
              "lsp",
              "path",
              "snippets",
              "buffer",
              "ripgrep",
            }
            -- conditionally add sources
            if vim.bo.filetype == "lua" then
              table.insert(sourceList, "lazydev")
            end
            return sourceList
          end,
          providers = {
            path = {
              async = true,
            },
            ripgrep = {
              module = "blink-ripgrep",
              name = "Ripgrep",
              opts = {
                prefix_min_len = 3,
                context_size = 4,
                max_filesize = "1M",
                project_root_marker = {
                  ".git",
                  "flake.lock",
                  "uv.lock",
                },
              },
            },
            lazydev = {
              name = "LazyDev",
              module = "lazydev.integrations.blink",
              score_offset = 100,
            },
          },
        },
        -- snippets
        snippets = {
          preset = "luasnip",
        },
        -- signature help
        signature = { enabled = true },
      }
    end,
  },
}
