{ pkgs ? import <nixpkgs> { } }:
let
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
