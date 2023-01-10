{ nixpkgs ? import <nixpkgs> { } }:
let
  ourPkgs = nixpkgs // pkgs;

  lib = import ./lib.nix;

  callPackage = lib.callPackageWithPkgSet ourPkgs;

  pkgs = with lib; {
    autotoolsDerivation = import ./autotools nixpkgs;

    hello = callPackage ./hello { };

    graphviz = callPackage ./graphviz {
      gdSupport = true;
    };

    graphvizCore = callPackage ./graphviz {
      gdSupport = false;
    };
  };
in
pkgs
