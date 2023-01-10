{ nixpkgs ? import <nixpkgs> { } }:
let
  ourPkgs = nixpkgs // pkgs;

  lib = import ./lib.nix;

  callPackage = lib.callPackageWithPkgSet ourPkgs;

  pkgs = with lib; rec {
    autotoolsDerivation = import ./autotools nixpkgs;

    hello = callPackage ./hello { };

    graphvizFull = callPackage ./graphviz { };

    graphvizBare = graphvizFull.override {
      gdSupport = false;
    };

    graphvizBareNext = graphvizBare.override {
     graphvizSrc = builtins.fetchurl {
        url =
          "https://gitlab.com/api/v4/projects/4207231/packages/generic/graphviz-releases/2.50.0/graphviz-2.50.0.tar.gz";
        sha256 = "139fqsxb84mwwqbydya8b6m2l4iq262fpd549h6pglmv22jj2w71";
      };
    };

    graphvizFullNext = graphvizBareNext.override {
      gdSupport = true;
    };

  };
in
pkgs
