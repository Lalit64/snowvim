{
  inputs,
  pkgs,
  system,
  ...
}:

pkgs.mkShell {
  nativeBuildInputs =
    with pkgs;
    [
      treefmt
      nixpkgs-fmt
      stylua
      just
    ]
    ++ (with inputs; [
      self.packages.${system}.snowvim
    ]);
}
