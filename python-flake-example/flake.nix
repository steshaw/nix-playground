{
  description = "A flake using poetry2nix";
  nixConfig.bash-prompt = "\[nix-develop\]$ ";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs";
  inputs.utils.url = "github:numtide/flake-utils";
  inputs.poetry2nix-src.url = "github:nix-community/poetry2nix";
  outputs = { nixpkgs, utils, poetry2nix-src, self }:
    utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; overlays = [ poetry2nix-src.overlay ]; };
        matrixInfraEnv = pkgs.poetry2nix.mkPoetryEnv {
          projectDir = ./.;
          python = pkgs.python39;
          editablePackageSources = {
            matrixInfra = ./.;
          };
        };
      in
      {
        devShell = pkgs.mkShell {
          buildInputs = [ matrixInfraEnv pkgs.python39Packages.pip ];
        };
      });
}
