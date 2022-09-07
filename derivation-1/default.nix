let
  # Pin to commit of release-22.05.
  nixpkgs = builtins.fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/5aeb3fb419b07a4ed5a55e4a500b8a0bb6d12c75.tar.gz";
  pkgs = import nixpkgs {
    overlays = [ ];
    config = { };
  };
in
builtins.trace
  ("pkgs.length = " +
  toString (builtins.length (builtins.attrNames pkgs))
  )
  pkgs.hello
