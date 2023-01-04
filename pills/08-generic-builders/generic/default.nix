with import <nixpkgs> {};
let v = "2.12";
    gcc = clang;
    bintools = clang.bintools.bintools_bin;
in
derivation {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  system = builtins.currentSystem;

  # Custom environment variables:
  deps = [
    gnutar
    gzip
    gnumake
    coreutils
    gawk
    gnused
    gnugrep
    gcc
    bintools
  ];
  src = builtins.fetchurl "http://ftp.gnu.org/gnu/hello/hello-${v}.tar.gz";
}
