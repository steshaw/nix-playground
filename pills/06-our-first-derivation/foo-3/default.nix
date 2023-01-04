with import <nixpkgs> {};
derivation {
  name = "foo";
  builder = "${bash}/bin/bash";
  args = [ "-e" "-x" ./script/build ];
  system = builtins.currentSystem;

  # Environment variables
  PATH = "${coreutils}/bin:${gnused}/bin";
}
