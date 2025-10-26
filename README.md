<h1 align="center">
    <a name="top" title="nvim-nix">
        ❄️Snowvim
    </a>
    <br />
</h1>

This flake uses [nixCats-nvim](https://github.com/BirdeeHub/nixCats-nvim) to configure neovim.
The advantage of using this over a configuration defined using [nixvim](https://github.com/nix-community/nixvim)
is that only the plugin installation is handled through [Nix](https://nixos.org/manual/nix/stable/language/index.html) and the rest of the configuration is done using Lua.

## Running the flake

To run this nix flake simply run the following command

```sh
nix run github:lalit64/snowvim
```

> [!NOTE]
> You will need to install the `nix` package manager before you can run the previous command

Or you can use the package to add this flake to your setup like so:

```nix
{
    inputs.neovim = {
      url = "github:lalit64/snowvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
}
```

And then install it by adding `inputs.neovim.packages.${system}.default` to your packages
