with builtins;
let
  # From `nix eval nixpkgs.lib.version`.
  nixPkgsVersion = "19.03pre167171.5476f592c56";

  rev = "5476f592c56";
  sha256 = "sha256:0gx5gw82f9j20q8y3wq1bgfdl56859zhmw0zl2cc361l6yyyz0jp";

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
