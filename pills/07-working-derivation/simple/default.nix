with import <nixpkgs> { };
derivation {
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  system = builtins.currentSystem;

  # Custom variables:
  inherit gcc coreutils;
  src = ./simple.c;
}
