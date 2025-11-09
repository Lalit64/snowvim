{inputs, ...}: {
  pkgs,
  settings,
  categories,
  extra,
  name,
  mkNvimPlugin,
  mkPlugin,
} @ packageDef: {
  lspsAndRuntimeDeps = with pkgs; {
    tools = {
      treesitter = [
        tree-sitter
      ];
      git = [
        git
        lazygit
      ];
      search = [
        ripgrep
        fd
        findutils
      ];
    };

    languages = {
      nix = [
        nix-doc
        nixd
        nil
        alejandra
        statix
      ];
      lua = [
        lua-language-server
        stylua
      ];
      c = [
        clang-tools
      ];
      shell = [
        bash-language-server
        dotenv-linter
        shfmt
      ];
      go = [
        gopls
        gofumpt
      ];
      web = [
        astro-language-server
        vscode-langservers-extracted
        typescript-language-server
        svelte-language-server
        prettierd
        biome
        stylelint
        eslint_d
      ];
      rust = [
        rust-analyzer
        rustfmt
      ];
    };
  };

  startupPlugins = with pkgs.vimPlugins; {
    system = [
      lze
      lzextras
    ];

    ui = {
      theme = [
        mini-icons
      ];
    };
  };

  optionalPlugins = with pkgs.vimPlugins; {
    system = [
      plenary-nvim
      nui-nvim
      mini-base16
      mini-colors
    ];

    tools = {
      general = [
        snacks-nvim
      ];
      completion = [
        nvim-lspconfig
        blink-cmp
        blink-ripgrep-nvim
        blink-cmp-spell
      ];
      file = [
        nvim-tree-lua
      ];
      formatting = [
        conform-nvim
        nvim-lint
      ];
      git = [
        gitsigns-nvim
      ];
      snippets = [
        luasnip
        friendly-snippets
      ];
      treesitter = [
        nvim-treesitter.withAllGrammars
        nvim-treesitter-refactor
        nvim-treesitter-textobjects
        nvim-ts-autotag
        nvim-ts-context-commentstring
      ];
      editing = [
        blink-pairs
        mini-comment
        better-escape-nvim
        tabout-nvim
        mini-surround
      ];
    };

    ui = {
      general = [
        noice-nvim
        nvim-notify
      ];
      theme = [
        catppuccin-nvim
        gruvbox-nvim
        tokyonight-nvim
      ];
      bar = [
        lualine-nvim
        bufferline-nvim
      ];
      views = [
        which-key-nvim
      ];
      icons = [
        lspkind-nvim
      ];
    };

    languages = {
      lua = [
        lazydev-nvim
      ];
      markdown = [
        render-markdown-nvim
      ];
    };
  };

  sharedLibraries = {};

  environmentVariables = {};

  extraWrapperArgs = {};

  python3.libraries = {
    system = python-pkgs:
      with python-pkgs; [
        pynvim
      ];
    languages = {
      python = python-pkgs:
        with python-pkgs; [
          ruff
          basedpyright
        ];
    };
  };

  extraLuaPackages = {};
}
