with import <nixpkgs> { };
derivation {
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  system = builtins.currentSystem;

  # Custom variables:
  gcc = gcc;
  coreutils = coreutils;
  simple_source_file = ./simple.c;
  PATH = "${binutils-unwrapped}/bin";
}
