local M = {}

M.lua_ls = {
  filetypes = { "lua" },
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      formatters = { ignoreComments = true },
      signatureHelp = { enabled = true },
      diagnostics = {
        globals = { "nixCats", "vim" },
        disable = { "missing-fields" },
      },
      telemetry = { enabled = false },
    },
  },
}

M.basedpyright = {
  settings = {
    basedpyright = {
      analysis = { typeCheckingMode = "standard" },
    },
  },
}

M.nixd = {
  filetypes = { "nix" },
  settings = {
    nixd = {
      nixpkgs = { expr = "import <nixpkgs> {}" },
      options = {
        darwin = {
          expr = "(builtins.getFlake ./.).darwinConfigurations.lalits-mbp.options",
        },
        home_manager = {
          expr = '(builtins.getFlake ./.).homeConfigurations."lalit@lalits-mbp".options',
        },
      },
    },
  },
}

M.gopls = {}

M.astro = {}

M.bashls = {}

M.dockerls = {}

M.jsonls = {}

M.harper_ls = {
  filetypes = { "markdown", "gitcommit", "typst", "html", "text" },
}

M.ltex_plus = {
  filetypes = {
    "bib",
    "org",
    "plaintex",
    "rst",
    "rnoweb",
    "tex",
    "pandoc",
    "quarto",
    "rmd",
    "context",
  },
  settings = {
    check_frequency = "save",
  },
}

M.texlab = {}

M.marksman = {}

M.ts_ls = {}

M.rust_analyzer = {}

M.svelte = {}

M.tailwindcss = {}

M.cssls = {}

M.html = {}

return M
