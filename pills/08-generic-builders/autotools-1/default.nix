with import <nixpkgs> {};
derivation {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  system = builtins.currentSystem;

  # Custom environment variables:
  buildInputs = [
    gnutar
    gzip
    gnumake
    gcc
    coreutils
    gawk
    gnused
    gnugrep
    bintools.bintools
  ];
  src = builtins.fetchurl http://ftp.gnu.org/gnu/hello/hello-2.12.tar.gz;
}
