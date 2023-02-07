{ sources ? import ../nix/sources.nix
, pkgs ? import sources.nixpkgs { overlays = [ ]; config = { }; }
}:
pkgs.mkShell {
  nativeBuildInputs = [ pkgs.buildPackages.python310 ];
}
