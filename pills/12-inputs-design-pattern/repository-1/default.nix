{ pkgs ? import <nixpkgs> { } }:
let
  autotoolsDerivation = import ./autotools pkgs;
in
{
  hello = import ./hello {
    inherit pkgs;
    inherit autotoolsDerivation;
  };
  graphiz = import ./graphiz {
    inherit pkgs;
    inherit autotoolsDerivation;
    gdSupport = true;
  };
}
