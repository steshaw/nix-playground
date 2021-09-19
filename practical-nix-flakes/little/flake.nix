{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-21.05";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        packages.hello = pkgs.hello;

        devShell = pkgs.mkShell {
          buildInputs = [
            self.packages.${system}.hello
            pkgs.cowsay
          ];
        };
      }
    );
}
