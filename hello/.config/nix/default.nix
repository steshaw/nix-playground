let
  bootstrap = import <nixpkgs> {};

  inherit (
    bootstrap.lib.importJSON ./nixpkgs.json
  ) rev sha256;

  nixpkgs1 = bootstrap.fetchFromGitHub {
    owner = "NixOS";
    repo  = "nixpkgs";
    inherit rev sha256;
  };

  nixpkgs2 = builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    inherit sha256;
  };

  useFetchTarball = true;
  nixpkgs = if useFetchTarball then nixpkgs2 else nixpkgs1;

  pkgs = import nixpkgs {
    config = {};
    overlays = [
      (import ./overlay.nix)
    ];
  };

  foo = builtins.trace "evaluating foo" "foo";

in builtins.trace "nixpkgs = ${nixpkgs}" pkgs.my-foobar
