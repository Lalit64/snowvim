{
  pkgs,
  inputs,
  lib,
  ...
}:
let
  # get the nixCats library with the builder function (and everything else) in it
  utils = import inputs.nixCats;
  # path to your new .config/nvim
  luaPath = lib.snowfall.fs.get-file "/modules/neovim";

  # see :help nixCats.flake.outputs.categories
  categoryDefinitions =
    {
      pkgs,
      settings,
      categories,
      extra,
      name,
      mkPlugin,
      ...
    }@packageDef:
    {
      lspsAndRuntimeDeps = {
        general = with pkgs; [
          ripgrep

          # lsps
          lua-language-server
          nixd
          gopls
          astro-language-server
          bash-language-server
          dockerfile-language-server
          vscode-langservers-extracted
          harper
          texlab
          marksman
          typescript-language-server
          rust-analyzer
          svelte-language-server

          # formatters
          stylua
          nixfmt-rfc-style
          shfmt
          gofumpt
          rustfmt
          ruff
          prettierd

          # linters
          stylelint
          eslint_d
        ];
      };

      # This is for plugins that will load at startup without using packadd:
      startupPlugins = {
        general = with pkgs.vimPlugins; [
          lze
          lzextras
          nvim-lspconfig
          plenary-nvim
          (nvim-treesitter.withPlugins (_: nvim-treesitter.allGrammars))
          nvim-treesitter-textobjects
          blink-cmp
          friendly-snippets
          luasnip
          gitsigns-nvim
          lspsaga-nvim
          conform-nvim
          comment-nvim
          nvim-lint
          nvim-autopairs
          nvim-ts-context-commentstring
          nvim-ts-autotag
          which-key-nvim
          vim-sleuth
          noice-nvim
          nvim-notify
          mini-icons
          nui-nvim
          lualine-nvim
          bufferline-nvim
          nvim-tree-lua
          snacks-nvim
          render-markdown-nvim
          mini-icons
          tokyonight-nvim
        ];
      };

      optionalPlugins = {
        general = with pkgs.vimPlugins; [
          lazydev-nvim
        ];
      };
    };

  # see :help nixCats.flake.outputs.packageDefinitions
  packageDefinitions = {
    # These are the names of your packages
    # you can include as many as you wish.
    # each of these sets are also written into the nixCats plugin for querying within lua.
    nvim =
      {
        pkgs,
        name,
        mkPlugin,
        ...
      }:
      {
        settings = {
          suffix-path = true;
          suffix-LD = true;
          # see :help nixCats.flake.outputs.settings
          # IMPORTANT:
          # your aliases may not conflict with other packages.
          # aliases = [ "vim" ];
        };
        # and a set of categories that you want
        # All categories you wish to include must be marked true
        categories = {
          general = true;
        };
        # anything else to pass and grab in lua with `nixCats.extra`
        extra = { };
      };
  };

  # We will build the one named nvim here and export that one.
  defaultPackageName = "nvim";

  # return our package!
in
utils.baseBuilder luaPath {
  inherit pkgs;
} categoryDefinitions packageDefinitions defaultPackageName
