let
  pkgs = import <nixpkgs> { };
  autotoolsDerivation = import ./autotools.nix pkgs;
in
autotoolsDerivation {
  name = "hello";
  src = builtins.fetchurl http://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz;
}
