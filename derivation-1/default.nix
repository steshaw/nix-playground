let
  nixpkgs = builtins.fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/release-21.05.tar.gz";
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
