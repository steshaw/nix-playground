with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "hello";
  src = ./hello-2.12.1.tar.gz;
}
