{ pkgs ? import ./nix { } }:
pkgs.mkShell {
  buildInputs = [
    pkgs.python3
    pkgs.poetry
  ];
}
