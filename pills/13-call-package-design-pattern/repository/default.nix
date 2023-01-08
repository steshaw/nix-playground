{ nixpkgs ? import <nixpkgs> { } }:
let
  autotoolsDerivation = import ./autotools nixpkgs;
  ourPkgs = nixpkgs // {
    inherit autotoolsDerivation;
  };
  # callPackage : Set Path OverridesSet -> Set
  callPackage = set: pathToF: overrides:
    let f = import pathToF; in f
      (
        builtins.intersectAttrs
          (builtins.functionArgs f)
          set // overrides
      );
in
{
  hello = callPackage ourPkgs ./hello { };

  graphviz = callPackage ourPkgs ./graphviz {
    gdSupport = true;
  };

  graphvizCore = callPackage ourPkgs ./graphviz {
    gdSupport = false;
  };
}
