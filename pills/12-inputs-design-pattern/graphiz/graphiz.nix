let
  pkgs = import <nixpkgs> { };
  autotoolsDerivation = import ./autotools.nix pkgs;
in
autotoolsDerivation {
  name = "graphviz";
  src = builtins.fetchurl {
    url =
      "https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.49.3/graphviz-2.49.3.tar.gz";
    sha256 = "1gycwaq6lnz03pizfibipq1j15hb975xdb0qsaagkq4qvhyj16zp";
  };
}
