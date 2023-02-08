{ nixpkgs ? import ./nix { }
}:
nixpkgs.mkShell {
  inputsFrom = [
    (import ./app1/shell.nix { pkgs = nixpkgs; })
    (import ./app2/shell.nix { pkgs = nixpkgs; })
  ];
}
