{ nixpkgs ? import <nixpkgs> { } }:
let
  ourPkgs = nixpkgs // pkgs // {
    autotoolsDerivation = import ./autotools nixpkgs;
  };

  # callPackage : Set Path OverridesSet -> Set
  callPackageWithPkgSet = pkgSet: pathToF: overrides:
    let f = import pathToF; in f
      ((builtins.intersectAttrs
        (builtins.functionArgs f)
        pkgSet) // overrides);

  callPackage = callPackageWithPkgSet ourPkgs;

  pkgs = {
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
