with builtins;
let
  # From `nix eval nixpkgs.lib.version`.
  nixpkgsVersion = "19.03pre167188.4b6020faf58";

  nixpkgs = fetchTarball {
    name = "my-nixpkgs-" + nixpkgsVersion;
    url = "https://releases.nixos.org/nixpkgs/nixpkgs-${nixpkgsVersion}/nixexprs.tar.xz";
    sha256 = "sha256:1m2aihxlkbjzbkz93dqcazkhzfwla1ry4yxk6yggw4nabv10bnc6";
  };

  pkgs = import nixpkgs {
    config = {};
    overlays = [
      (import ./overlay.nix)
    ];
  };

in trace "nixpkgs = ${nixpkgs}" pkgs.my-foobar
