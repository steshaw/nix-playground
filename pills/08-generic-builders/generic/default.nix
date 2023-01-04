with import <nixpkgs> {};
derivation {
  name = "hello";
  builder = "${bash}/bin/bash";
  args = [ ./builder.bash ];
  system = builtins.currentSystem;

  # Custom environment variables:
  deps = [
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
  #AR = "llvm-ar";
  src = builtins.fetchurl http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz;
}
