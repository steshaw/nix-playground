{ nixpkgs ? import <nixpkgs> { } }:
let
  ourPkgs = nixpkgs // pkgs // {
    autotoolsDerivation = import ./autotools nixpkgs;
  };

  # callPackage : Set Path OverridesSet -> Set
  callPackage = set: pathToF: overrides:
    let f = import pathToF; in f
      (
        builtins.intersectAttrs
          (builtins.functionArgs f)
          set // overrides
      );
  pkgs = {
    hello = callPackage ourPkgs ./hello { };

    graphviz = callPackage ourPkgs ./graphviz {
      gdSupport = true;
    };

    graphvizCore = callPackage ourPkgs ./graphviz {
      gdSupport = false;
    };
  };
in
pkgs
