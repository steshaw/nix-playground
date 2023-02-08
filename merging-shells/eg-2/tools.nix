{ pkgs ? import ./nix { }
}:
pkgs.mkShell {
  packages = [ pkgs.jq pkgs.overmind ];
}
