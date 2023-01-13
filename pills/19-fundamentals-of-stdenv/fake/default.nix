let pkgs = import <nixpkgs> {};
in
derivation {
  name = "fake";
  builder = "fake";
  system = "x86_64-linux";

  stdenv = pkgs.stdenv;
}
