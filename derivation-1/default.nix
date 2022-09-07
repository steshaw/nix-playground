let
  nixpkgs = builtins.fetchTarball
    https://github.com/NixOS/nixpkgs/archive/release-21.05.tar.gz;
  pkgs = import nixpkgs {};
in
builtins.length (builtins.attrNames pkgs)
