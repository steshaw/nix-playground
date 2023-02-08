{
  inputs = {
    #nixpkgs.url = "nixpkgs/21.11"
    nixpkgs.url = "nixpkgs/release-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.default = import ./shell.nix {
          inherit pkgs;
        };
      }
    );
}
