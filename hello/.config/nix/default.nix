with builtins;
let
  importJSON = path: fromJSON (readFile path);

  inherit ( importJSON ./nixpkgs.json ) rev sha256;

  nixpkgs = fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
    inherit sha256;
  };

  pkgs = import nixpkgs {
    config = {};
    overlays = [
      (import ./overlay.nix)
    ];
  };

  foo = trace "evaluating foo" "foo";

in trace "nixpkgs = ${nixpkgs}" pkgs.my-foobar
