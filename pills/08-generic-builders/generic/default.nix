with import <nixpkgs> {};
derivation {
  name = "hello";
  builder = "${bash_5}/bin/bash";
  args = [ ./builder.bash ];

  buildInputs = [
    clang
    coreutils
    gawk
    gnugrep
    gnumake
    gnused
    gnutar
    gzip
    llvm
  ];

  AR = "llvm-ar";
  RANLIB = "llvm-ranlib";

  src = builtins.fetchurl http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz;
  system = builtins.currentSystem;
}
