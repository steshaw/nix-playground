{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        system-nixpkgs = nixpkgs.legacyPackages.${system};
        our-pkgs = (import ./default.nix) {
          nixpkgs = system-nixpkgs;
        };
        our-drvs = with nixpkgs.lib;
          filterAttrs (name: value: isDerivation value) our-pkgs;
        all = system-nixpkgs.linkFarm "all" our-drvs;
      in
      {
        packages = our-pkgs // {
          inherit all;
          default = all;
        };
      }
    );
}
