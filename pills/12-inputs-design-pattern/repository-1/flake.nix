{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      {
        packages = flake-utils.lib.flattenTree (import ./default.nix)
        #{ pkgs = nixpkgs.legacyPackages.${system}; }
        ;
      }
    );
}
