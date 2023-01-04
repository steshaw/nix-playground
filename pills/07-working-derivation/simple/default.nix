with import <nixpkgs> { };
derivation {
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  system = builtins.currentSystem;

  # Custom variables:
  gcc = gcc;
  coreutils = coreutils;
  src = ./simple.c;
}
