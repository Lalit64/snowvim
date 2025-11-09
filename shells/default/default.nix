{
  inputs,
  pkgs,
  system,
  ...
}:
pkgs.mkShell {
  nativeBuildInputs = with pkgs;
    [
      treefmt
      alejandra
      stylua
      just
    ]
    ++ (with inputs; [
      self.packages.${system}.snowvim
    ]);
}
