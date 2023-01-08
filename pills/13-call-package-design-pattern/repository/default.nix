{ pkgs ? import <nixpkgs> { } }:
let
  callPackage = set: f: overrides: f (
    builtins.intersectAttrs
      (builtins.functionArgs f)
      set // overrides
  );
  autotoolsDerivation = import ./autotools pkgs;
in
with pkgs;
let
  defaultGraphvizArgs = {
    inherit autotoolsDerivation;
    inherit lib;
    inherit gd;
    inherit pkg-config;
  };
  add = {a ? 3, b}: a + b;
  values = {
    a = 10;
    b = 32;
    c = 42;
    d = 99;
  };
in
{
  inherit callPackage;
  test1 = callPackage values add {};
  test2 = callPackage values add { a = 0; };

  hello = import ./hello {
    inherit autotoolsDerivation;
  };
  graphviz = import ./graphviz (defaultGraphvizArgs // {
    gdSupport = true;
  });
  graphvizCore = import ./graphviz (defaultGraphvizArgs // {
    gdSupport = false;
  });
}
