let
  # Pin to commit of nixpkgs-22.05-darwin.
  rev = "a7f0b0832f9da86d25089ea2b4cacdea64072d7f";
  nixpkgs = builtins.fetchTarball
    "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  pkgs = import nixpkgs {
    overlays = [ ];
    config = { };
  };

  secondDrv = pkgs.stdenv.mkDerivation {
    name = "Second";
    src = ./src;
    makeFlags = [ "PREFIX=$(out)" ];
  };
in
secondDrv
