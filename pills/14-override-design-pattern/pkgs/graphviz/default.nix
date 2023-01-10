{ autotoolsDerivation
, lib
, gdSupport ? true
, gd
, pkg-config
# Cannot call the following `src` as that is a existing pkg in nixpkgs...
# :-o
, graphvizSrc ? builtins.fetchurl {
    url =
      "https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.49.3/graphviz-2.49.3.tar.gz";
    sha256 = "1gycwaq6lnz03pizfibipq1j15hb975xdb0qsaagkq4qvhyj16zp";
  }
}:
builtins.trace "gdSupport=${toString gdSupport} gd=${gd}" autotoolsDerivation {
  name = "graphviz";
  src = graphvizSrc;
  buildInputs =
    if gdSupport then [
      pkg-config
      (lib.getLib gd)
      (lib.getDev gd)
    ] else [ ];
}
