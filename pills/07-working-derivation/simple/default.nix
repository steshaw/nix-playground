with import <nixpkgs> {};
derivation {
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  gcc = gcc;
  coreutils = coreutils;
  simple_source_file = ./simple.c;
  system = builtins.currentSystem;
}
