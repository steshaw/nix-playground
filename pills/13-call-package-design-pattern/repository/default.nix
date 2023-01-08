{ pkgs ? import <nixpkgs> { } }:
let
  autotoolsDerivation = import ./autotools pkgs;
  # callPackage : Set Path OverridesSet -> Set
  callPackage = set: pathToF: overrides:
    let f = import pathToF; in f
      (
        builtins.intersectAttrs
          (builtins.functionArgs f)
          set // overrides
      );
in
with pkgs;
let
  defaultGraphvizArgs = {
    inherit autotoolsDerivation;
    inherit lib;
    inherit gd;
    inherit pkg-config;
  };
in
{
  hello = import ./hello {
    inherit autotoolsDerivation;
  };

  graphviz = callPackage defaultGraphvizArgs
    ./graphviz
    {
      gdSupport = true;
    };

  graphvizCore = callPackage defaultGraphvizArgs
    ./graphviz
    {
      gdSupport = false;
    };
}
