with import <nixpkgs> {};
/*
stdenv.mkDerivation {
*/
derivation {
  name = "foo-bar";
  builder = "${bash_5}/bin/bash";
  args = [ ./builder.bash ];
  bust = 5;
  system = builtins.currentSystem;
#  ps = "${coreutils}/bin/ps";
#  buildInputs = [ coreutils ];
}
