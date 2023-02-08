{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs { }
}:
pkgs.mkShell {
  packages = [ pkgs.jq pkgs.overmind ];
}
