{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShells.legacy-shell = import ./shell.nix {
          inherit pkgs;
        };
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            go_1_18
            nodePackages.prettier
            cargo
            python38
            openssl
          ];
        };
      }
    );
}
