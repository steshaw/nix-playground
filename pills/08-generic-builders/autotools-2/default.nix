let
  pkgs = import <nixpkgs> { };
  mkDerivation = import ./autotools.nix pkgs;
in
mkDerivation {
  name = "hello";
  src = builtins.fetchurl http://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz;
}
