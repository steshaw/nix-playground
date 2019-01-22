with builtins;
let
  importJSON = path: fromJSON (readFile path);

  inherit ( importJSON ./nixpkgs.json ) rev sha256;

  # From `nix eval nixpkgs.lib.version`.
  nixPkgsVersion = "19.03pre166683.088cb13aee0";

  nixpkgs = fetchTarball {
    name = "my-nixpkgs-" + nixPkgsVersion;
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
