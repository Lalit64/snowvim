{
  inputs,
  pkgs,
  lib,
}:
let
  utils = import inputs.nixCats;

  luaPath = lib.snowfall.fs.get-file "/modules/snowvim";

  categoryDefinitions = import ./categoryDefinitions.nix {
    inherit inputs;
  };

  # see :help nixCats.flake.outputs.categories
  packageDefinitions = {
    snowvim =
      {
        pkgs,
        ...
      }:
      {
        settings = {
          suffix-path = true;
          suffix-LD = true;
          wrapRc = true;
          aliases = [ "vim" ];
          neovim-unwrapped = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.neovim;
        };

        categories = {
          system = true;
          tools = true;
          languages = true;
          ui = true;
        };

        extra = {
          colorscheme = {
            name = "tokyonight";
            style = "dark";
            transparent = true;
          };
        };
      };
  };

  defaultPackageName = "snowvim";
in
utils.baseBuilder luaPath {
  inherit pkgs;
} categoryDefinitions packageDefinitions defaultPackageName
