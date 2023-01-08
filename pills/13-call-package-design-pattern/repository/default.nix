{ pkgs ? import <nixpkgs> { } }:
let
  autotoolsDerivation = import ./autotools pkgs;
  # callPackage : Set Function OverridesSet -> Set
  cp = import ./call-package.nix;
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

  graphviz = cp.callPackage defaultGraphvizArgs
    (
      import ./graphviz
    )
    {
      gdSupport = true;
    };

  graphvizCore = cp.callPackage defaultGraphvizArgs
    (import ./graphviz)
    {
      gdSupport = false;
    };
}
