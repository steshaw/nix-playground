pkgs: attrs:
with pkgs;
let
  defaultAttrs = {
    builder = "${bash}/bin/bash";
    args = [ ./builder.bash ];
    system = pkgs.system;

    # Custom environment variables.
    setup = ./setup.bash;
    baseInputs = [
      bash
      clang
      clang.bintools.bintools_bin
      coreutils
      findutils
      gawk
      gnugrep
      gnumake
      gnused
      gnutar
      gzip
      patchelf
    ];
    buildInputs = [ ];
  };
in
derivation (defaultAttrs // attrs)
