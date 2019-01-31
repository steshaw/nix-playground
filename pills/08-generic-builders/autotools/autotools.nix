pkgs: attrs:
with pkgs;
let defaultAttrs = {
#  name = "hello";
  builder = "${bash_5}/bin/bash";
  args = [ ./builder.bash ];

  baseInputs = [
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
  buildInputs = [];

  AR = "llvm-ar";

#  src = builtins.fetchurl http://ftp.gnu.org/gnu/hello/hello-2.10.tar.gz;
  system = builtins.currentSystem;
};
in derivation (defaultAttrs // attrs)
