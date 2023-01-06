{ pkgs ? import <nixpkgs> { } }:
let
  autotoolsDerivation = import ./autotools pkgs;
in
with pkgs;
  let f-graphviz=  gdSupport: import ./graphiz {
    inherit autotoolsDerivation;
    inherit lib;
    inherit gd;
    inherit pkg-config;
    inherit gdSupport;
  }; in
  {
  hello = import ./hello {
    inherit autotoolsDerivation;
  };
  graphviz = f-graphviz true;
  graphvizCore = f-graphviz false;
}
