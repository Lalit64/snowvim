{
  description = "snowvim";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/nixos/nixpkgs/0.1";

    snowfall-lib = {
      url = "https://flakehub.com/f/snowfallorg/lib/3.0.3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixCats.url = "github:birdeehub/nixcats-nvim";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;

      snowfall = {
        namespace = "snowvim";
      };

      alias.packages.default = "snowvim";

      outputs-builder = channels: {
        formatter = channels.nixpkgs.alejandra;
      };
    };
}
