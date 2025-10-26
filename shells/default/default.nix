{
  inputs,
  pkgs,
  system,
  ...
}:

pkgs.mkShell {
  nativeBuildInputs = (
    with pkgs;
    [
      nixfmt-tree
      nixpkgs-fmt
      just
    ]
  );
}
