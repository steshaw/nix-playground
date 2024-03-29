with import <nixpkgs> {};
let v = "2.12";
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
    clang
    clang.bintools.bintools_bin
  ];
  src = builtins.fetchurl "http://ftp.gnu.org/gnu/hello/hello-${v}.tar.gz";
}
