let pkgs = import <nixpkgs> { };
in {
  default = pkgs.hello;
  pkgs = { ghc = pkgs.ghc; };
}
