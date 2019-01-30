with import <nixpkgs> {};
/*
stdenv.mkDerivation {
*/
derivation {
  name = "foo-bar";
  builder = "${bash}/bin/bash";
  system = builtins.currentSystem;
  args = [ ./builder.sh ];
  bust = 5;
#  ps = "${coreutils}/bin/ps";
#  buildInputs = [ coreutils ];
}
