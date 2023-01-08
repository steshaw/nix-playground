{
  inputs.nixpkgs.url = github:NixOS/nixpkgs/nixos-22.11;
  inputs.flake-utils.url = github:numtide/flake-utils;

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        system-nixpkgs = nixpkgs.legacyPackages.${system};
        our-pkgs = (import ./default.nix) {
          pkgs = system-nixpkgs;
        };
        all = system-nixpkgs.linkFarm "all" our-pkgs;
      in
      {
        packages = our-pkgs // {
          inherit all;
          default = all;
        };
      }
    );
}
