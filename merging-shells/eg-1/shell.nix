{ sources ? import ./nix/sources.nix
, nixpkgs ? import sources.nixpkgs { overlays = [ ]; config = { }; }
}:
nixpkgs.mkShell {
  inputsFrom = [
    (import ./pkg1/shell.nix { pkgs = nixpkgs; })
    (import ./pkg2/shell.nix { pkgs = nixpkgs; })
  ];
}
