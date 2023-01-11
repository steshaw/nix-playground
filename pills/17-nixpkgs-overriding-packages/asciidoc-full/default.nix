let
  pkgs =
    import ../nixpkgs-2016 {
      config = import ./config.nix;
    };
in
pkgs.asciidocFull
