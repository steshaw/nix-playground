{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-22.11";
  outputs = { self, nixpkgs }: {
    devShells.x86_64-linux.default =
      let pkgs = nixpkgs.legacyPackages."x86_64-linux";
      in pkgs.mkShell {
        buildInputs = with pkgs; [
          go_1_18
          nodePackages.prettier
          cargo
          python38
          openssl
        ];
      };
  };
}
