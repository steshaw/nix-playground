with import <nixpkgs> {};
derivation {
  name = "simple";
  builder = "${bash_5}/bin/bash";
  args = [ ./builder.bash ];
  inherit gcc coreutils binutils-unwrapped;
  binutils = binutils-unwrapped; # TODO: Maybe only necessary on macOS.
  src = ./simple.c;
  system = builtins.currentSystem;
}
