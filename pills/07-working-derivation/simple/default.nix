with import <nixpkgs> {};
derivation {
  name = "simple";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  inherit gcc coreutils binutils-unwrapped;
  binutils = binutils-unwrapped; # TODO: Maybe only necessary on macOS.
  simple_source_file = ./simple.c;
  system = builtins.currentSystem;
}
