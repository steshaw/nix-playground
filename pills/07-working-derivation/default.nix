#with import <nixpkgs> {};
/*
stdenv.mkDerivation {
*/
derivation {
  name = "foo-bar";
  builder = ./builder.sh;
  system = builtins.currentSystem;
  args = [ "a" "b" "c" 1 2 3 ];
  bust = 4;
#  ps = "${coreutils}/bin/ps";
#  buildInputs = [ coreutils ];
}
