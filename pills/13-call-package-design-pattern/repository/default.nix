{ pkgs ? import <nixpkgs> { } }:
let
  callPackage = set: f: f (
    builtins.intersectAttrs
      (builtins.functionArgs f)
      set
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
in
{
  add = {a ? 3, b}: a + b;
  values = {
    a = 10;
    b = 32;
    c = 42;
    d = 99;
  };
  inherit callPackage;
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
