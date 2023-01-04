with import <nixpkgs> {};
let v = "2.12"; in
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
    gcc
    coreutils
    gawk
    gnused
    gnugrep
  ];
  src = builtins.fetchurl "http://ftp.gnu.org/gnu/hello/hello-${v}.tar.gz";
}
