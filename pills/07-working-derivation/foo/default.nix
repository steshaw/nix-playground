with import <nixpkgs> {};
derivation {
  name = "foo";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  system = builtins.currentSystem;

  PATH = "${findutils}/bin";
}
