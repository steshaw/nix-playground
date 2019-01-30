with import <nixpkgs> {};
derivation {
  name = "foo";
  builder = "${bash_5}/bin/bash";
  args = [ ./builder.bash ];
  bust = 5;
  system = builtins.currentSystem;
}
